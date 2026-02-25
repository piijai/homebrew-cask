cask "copilot-cli@prerelease" do
  arch arm: "arm64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "0.0.418-0"
  sha256 arm:          "6c3ba9b3c40c9b6f0a9b0e496a495171068b03a63e576324c24c0e5a6ac89c7a",
         intel:        "babe436793dd49fd869ea8aa735679b58bae0309034bcc55f7d534be27688bb4",
         arm64_linux:  "e5e4144608980db15bafc77d17953f6c42bb4f66953a0c8aacbba62b4459b771",
         x86_64_linux: "2bce83dd02cd36d7d3eabeeec68eb99b357b75ce380159cc0f15abc372a9ee9b"

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
