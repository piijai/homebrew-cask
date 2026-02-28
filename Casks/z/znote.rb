cask "znote" do
  arch arm: "-arm64"

  version "3.6.6"
  sha256 arm:   "da345a707b43ffc9bc2333b3026f187a48dec6119a2474ede64503ecbecdb329",
         intel: "3e2570832e0f6992b3e494cae3b1ebee2b4d968e5dda3e0eaebc74d7f5b7c350"

  url "https://github.com/alagrede/znote-app/releases/download/v#{version}/znote-#{version}#{arch}.dmg",
      verified: "github.com/alagrede/znote-app/"
  name "Znote"
  desc "Notes-taking app"
  homepage "https://znote.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "znote.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.tony.znote.sfl*",
    "~/Library/Application Support/znote",
    "~/Library/Preferences/com.tony.znote.plist",
    "~/Library/Saved Application State/com.tony.znote.savedState",
  ]
end
