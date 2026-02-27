cask "luxury-yacht" do
  arch arm: "arm64", intel: "amd64"

  version "1.3.10"
  sha256 arm:   "85cc9239092cc157bb941245808432122a27512e7d2cf9553bb75a3d884664cb",
         intel: "51f814ba991f45390c76d2ab344925b23da04b3e126266700dc16d656fcfaae9"

  url "https://github.com/luxury-yacht/app/releases/download/v#{version}/luxury-yacht-v#{version}-macos-#{arch}.dmg",
      verified: "github.com/luxury-yacht/app/"
  name "Luxury Yacht"
  desc "Desktop app for managing Kubernetes clusters"
  homepage "https://luxury-yacht.app/"

  app "Luxury Yacht.app"

  zap trash: "~/Library/Application Support/luxury-yacht"
end
