cask "copilot-cli@prerelease" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "0.0.415-0"
  sha256 arm:          "5158cb746aff5110947ffb04e93190856c1a2fa331a54f716e733302292d5d9e",
         intel:        "c513614875a4c02c7b4b0c906fc64c9814fa151768a423709a4954a89c2e0e2b",
         arm64_linux:  "a829b41d898bc0f445a812a39815531efd0f38480d1f8f0f715315887322683a",
         x86_64_linux: "d71632cb8510ecf8231ad7a778fe07a71293378c5c78032c6135e2d87691711e"

  url "https://github.com/github/copilot-cli/releases/download/v#{version}/copilot-#{os}-#{arch}.tar.gz"
  name "GitHub Copilot CLI"
  desc "Brings the power of Copilot coding agent directly to your terminal"
  homepage "https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli"

  livecheck do
    url :url
    regex(/^v?(\d+(?:[.-]\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  conflicts_with cask: "copilot-cli"
  depends_on macos: ">= :ventura"

  binary "copilot"

  zap trash: "~/.copilot"
end
