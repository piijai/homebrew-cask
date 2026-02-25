cask "droid" do
  arch arm: "arm64", intel: "x64"

  version "0.62.1"
  sha256 arm:   "fc32033f29717ede29a3aff3e73aa836c1de9aa94aa63e2ac3b86a8fb1c384fd",
         intel: "70ae9e5f96944ba1564ea5a0dce0de9de38cbb73f04e0091cdd88e4d54a5ddba"

  url "https://downloads.factory.ai/factory-cli/releases/#{version}/darwin/#{arch}/droid"
  name "Droid"
  desc "AI-powered software engineering agent by Factory"
  homepage "https://docs.factory.ai/cli/getting-started/overview"

  livecheck do
    url "https://downloads.factory.ai/factory-cli/LATEST"
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  depends_on formula: "ripgrep"

  binary "droid"

  zap trash: [
    "~/.factory",
    "~/.local/bin/droid",
  ]
end
