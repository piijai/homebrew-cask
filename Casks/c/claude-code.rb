cask "claude-code" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "2.1.56"
  sha256 arm:          "c79534202fd33f11f1111ee0a0fa10143187a345e095cb2dd8b6186d8dcc6f5f",
         x86_64:       "80bccdd96af123dd1cc7fb9b6e32a56c2965dc374a5084fb5283294609b1aff3",
         x86_64_linux: "e139d71f9dec4d86308341b16d00c24441c789d0156852364a4c7dcf3f2e9b3e",
         arm64_linux:  "566ce5c41ac7ecbb259d46fe5d58d45c03e70323a0ff3f05a0ddc358d81f73a1"

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
