cask "claude-code" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "2.1.58"
  sha256 arm:          "182c20c6080d042e4e08a6b2a2ce8258c1a50e53c01d36ddf20a82b4693395ea",
         x86_64:       "fb2ccc6872d498fc571f302059d51aec7c89b0df4d21d247a9a249c1a3a835dc",
         x86_64_linux: "10f68e45b5ff4a80ae21e6d7a95dfe673ab3391313358ccd94e827f379f6aaa0",
         arm64_linux:  "5edd4b6be6b9e9c00e5805f022ee924a98fdcf1bf0c04635a429d2666eccbc3f"

  url "https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/#{version}/#{os}-#{arch}/claude",
      verified: "storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/"
  name "Claude Code"
  desc "Terminal-based AI coding assistant"
  homepage "https://www.anthropic.com/claude-code"

  livecheck do
    url "https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/latest"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  binary "claude"

  zap trash: [
        "~/.cache/claude",
        "~/.claude.json*",
        "~/.config/claude",
        "~/.local/bin/claude",
        "~/.local/share/claude",
        "~/.local/state/claude",
        "~/Library/Caches/claude-cli-nodejs",
      ],
      rmdir: "~/.claude"
end
