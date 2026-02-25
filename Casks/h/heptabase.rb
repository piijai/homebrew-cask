cask "heptabase" do
  arch arm: "-arm64"

  version "1.84.1"
  sha256 arm:   "56fb1291cce0bd551749b5c2e5a1c3465dc98382df09bfa1ee40071a13cc744a",
         intel: "0321311a7edd938808f47bfde0715d30d9e82100b5bff7abdf6f3dad1b00adb2"

  url "https://github.com/heptameta/project-meta/releases/download/v#{version}/Heptabase-#{version}#{arch}-mac.zip",
      verified: "github.com/heptameta/project-meta/"
  name "Hepta"
  desc "Note-taking tool for visual learning"
  homepage "https://heptabase.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Heptabase.app"

  zap trash: [
    "~/Library/Preferences/app.projectmeta.projectmeta.plist",
    "~/Library/Saved Application State/app.projectmeta.projectmeta.savedState",
  ]
end
