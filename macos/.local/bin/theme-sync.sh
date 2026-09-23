#!/usr/bin/env bash
# Syncs tmux and nvim to the current macOS light/dark appearance.
# Triggered by com.jean.theme-sync.plist (LaunchAgent) on appearance change.
#
# kitty is not handled here:
#  - kitty follows the OS appearance natively (dark-theme.auto.conf /
#    light-theme.auto.conf) and reports changes via DEC mode 2031, so pi
#    auto-switches themes by itself (tmux 3.7 relays the reports).
set -euo pipefail

STATE_FILE="$HOME/.cache/theme-mode"

# launchd runs this with a bare PATH (/usr/bin:/bin:/usr/sbin:/sbin), so
# tmux (installed via Homebrew) won't resolve through `command -v`/bare `tmux`.
TMUX_BIN=""
for candidate in /opt/homebrew/bin/tmux /usr/local/bin/tmux /usr/bin/tmux; do
    if [[ -x "$candidate" ]]; then
        TMUX_BIN="$candidate"
        break
    fi
done

style=$(defaults read -g AppleInterfaceStyle 2>/dev/null || true)
if [[ "$style" == "Dark" ]]; then
    mode="dark"
    flavor="mocha"
else
    mode="light"
    flavor="latte"
fi

if [[ "$(cat "$STATE_FILE" 2>/dev/null || true)" == "$mode" ]]; then
    exit 0
fi

mkdir -p "$(dirname "$STATE_FILE")"
echo "$mode" >"$STATE_FILE"

# tmux: update the flavor option and re-run the plugin to repaint the status bar.
# catppuccin/tmux sets its color variables with `-ogq` (only if unset), so a
# plain re-run of the plugin is a no-op once they're baked in; unset them
# first so the re-run's -ogq sets actually take.
if [[ -n "$TMUX_BIN" ]] && "$TMUX_BIN" info &>/dev/null; then
    "$TMUX_BIN" set-option -g @catppuccin_flavor "$flavor"
    "$TMUX_BIN" show-options -g | awk '/^@(thm_|_ctp_|catppuccin_)/{print $1}' | grep -v '^@catppuccin_flavor$' |
        while read -r opt; do "$TMUX_BIN" set-option -gu "$opt"; done
    # source-file (not a direct run-shell of the plugin) so that tmux.conf's
    # own @catppuccin_window_*_text overrides re-apply before the plugin's
    # -ogq defaults would otherwise win.
    "$TMUX_BIN" source-file "$HOME/.tmux.conf"
fi

# nvim: no push mechanism, running instances pick up $STATE_FILE on next
# FocusGained (see init.lua).
