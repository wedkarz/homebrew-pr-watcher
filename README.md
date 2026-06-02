# homebrew-pr-watcher

Homebrew tap for [PR Watcher](https://github.com/wedkarz/pr-watcher) — a macOS menu bar app that surfaces the state of GitHub PRs across three buckets (authored / team-reviews / codeowner-reviews) with notifications, CI status, JIRA & Figma links.

This tap hosts both the Cask formula and the signed/notarized binary releases.

## Install

```sh
brew tap wedkarz/pr-watcher
brew install --cask pr-watcher
```

Or in a single line:

```sh
brew install --cask wedkarz/pr-watcher/pr-watcher
```

## What you'll see on first launch

1. The setup wizard window opens automatically. It checks that `gh` is installed and authenticated with `repo` + `read:org` scopes, then walks through:
   - **Repositories** to track (picked from `GET /user/repos`).
   - **Teams** you're on (picked from `GET /user/teams`).
   - **JIRA base URL** (optional — auto-suggested from your repo owner; the Verify button confirms it's reachable).
   - **Notifications** (CI failure, review activity, reply-to-my-comment).
   - **Launch at login**.
2. Click **Finish** — the menu bar icon turns from gray (loading) to green / yellow / red based on current state. Click it to see the popover.

Config lives at `~/.config/pr-watcher/config.json` — hand-edit anytime; the app hot-reloads.

## Requirements

- macOS 14 Sonoma or later (Apple Silicon or Intel).
- [`gh` CLI](https://cli.github.com) installed and authenticated with `repo` + `read:org` scopes:
  ```sh
  brew install gh
  gh auth login -s repo,read:org
  ```

## Upgrade

```sh
brew update
brew upgrade --cask pr-watcher
```

## Uninstall

```sh
brew uninstall --cask pr-watcher
```

`brew uninstall --cask --zap pr-watcher` additionally trashes the config and caches.

## Source

The source repo is private (it's a personal project with some organization-specific defaults baked in). The Cask + the notarized binary attached to each release here are sufficient to run the app — no source access required.

## Issues / requests

Open an issue on this tap repo and the maintainer will route it to the private source repo.
