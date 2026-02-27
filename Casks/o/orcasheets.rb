cask "orcasheets" do
  arch arm: "arm64", intel: "x86_64"

  version "26.2.3"
  sha256 arm:   "ab6f4122e591629ecabc0713f2d33107786eca25077d9b6cd5079a00f3873db0",
         intel: "141f59736d1334201a95c640408c49a04023eba72b96eaf284f485989160042e"

  url "https://github.com/dataorchestration/homebrew-orcasheets/releases/download/#{version}/orcasheets_#{version}_#{arch}.dmg",
      verified: "github.com/dataorchestration/homebrew-orcasheets/"
  name "OrcaSheets"
  desc "Local-first data analytics"
  homepage "https://orcasheets.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "OrcaSheets.app"

  zap trash: "~/Library/Application Support/OrcaSheets"
end
