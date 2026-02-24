cask "claude-code" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "2.1.52"
  sha256 arm:          "21e8c49b3111fa69e88f450a94ee4e88df69312823017bbf61ff86a461fcfc23",
         x86_64:       "447a6fa3238aa7007bffcc599104dc438de61d0c80ffaac42d1d4e8eb6eb97c0",
         x86_64_linux: "70c1f9881b7c091c49f3695c94c381d9cca0af094bcbc99cb9f463e44d97ce9c",
         arm64_linux:  "afe081990936550a98edc680860e6f16cd9fad300fb53b4ab27c7071c70968f2"

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
