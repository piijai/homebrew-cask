cask "copilot-cli@prerelease" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "0.0.416"
  sha256 arm:          "00c44a9f824b120c6377b9a8ca0cd099d5c5c2fa67003ecf905451e63c1016ed",
         intel:        "07ef3802d338a679731c7387e8cb8ba58b473f86ae51e5a0097d56f14ee3c46d",
         arm64_linux:  "0cd75d195bfe81266f246172917aa026e4555bf5bcf5b18826e4692104261674",
         x86_64_linux: "9ad1d22326f400d3471f2a1f12cfc2ba83a858282df1931aaf6631e958554ed6"

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
