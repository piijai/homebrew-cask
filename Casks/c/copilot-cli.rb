cask "copilot-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "0.0.419"
  sha256 arm:          "d6f35d944dde7888cb4836c99f24d0127ff78b49f4f7c614c9c3d4b5b67d8cd7",
         intel:        "8388e3662aa735b640a5c8054161975ddc3a698dfd76989586ef9823b5ed08c7",
         arm64_linux:  "7d2be6e31838805038c9683333ae3e8bdf62c4d0e5cb2f4bc0316145979c4d49",
         x86_64_linux: "b91e242a08366c08ece8aa7eaa8622515c0d3ce417c81019d41f92f169c3daf5"

  url "https://github.com/github/copilot-cli/releases/download/v#{version}/copilot-#{os}-#{arch}.tar.gz"
  name "GitHub Copilot CLI"
  desc "Brings the power of Copilot coding agent directly to your terminal"
  homepage "https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "copilot-cli@prerelease"
  depends_on macos: ">= :ventura"

  binary "copilot"

  zap trash: "~/.copilot"
end
