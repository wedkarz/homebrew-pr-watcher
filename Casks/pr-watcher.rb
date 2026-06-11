cask "pr-watcher" do
  version "0.6.0"
  sha256 "22ccda98b83bfea74a7fe58be6faf0d4dd54f82507abc7194ac14cfeb44de4e2"

  url "https://github.com/wedkarz/homebrew-pr-watcher/releases/download/v#{version}/PRWatcher-#{version}.zip"
  name "PR Watcher"
  desc "macOS menu bar app that tracks GitHub PRs (authored / team / codeowner)"
  homepage "https://github.com/wedkarz/homebrew-pr-watcher"

  depends_on macos: ">= :sonoma" # macOS 14+

  app "PRWatcher.app"

  postflight do
    # The binary is notarized + Developer ID signed; macOS Gatekeeper should accept it on first launch.
    # Strip quarantine just in case (no-op when not present).
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PRWatcher.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/PRWatcher",
    "~/Library/Caches/com.wedkarz.PRWatcher",
    "~/Library/Preferences/com.wedkarz.PRWatcher.plist",
    "~/.config/pr-watcher"
  ]
end
