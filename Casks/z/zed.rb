cask "zed" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.195.5"
  sha256 arm:   "9c05ffaa66e40ae6a8d7e7f411c31293a7bea285bbd7a8105a7ef478c59c0d37",
         intel: "1fa2d31664949fc1985103597f7f01463eb58fa05be4c9d6b8c8909f6fc604a8"

  url "https://zed.dev/api/releases/stable/#{version}/Zed-#{arch}.dmg"
  name "Zed"
  desc "Multiplayer code editor"
  homepage "https://zed.dev/"

  livecheck do
    url "https://zed.dev/api/releases/latest?asset=Zed.dmg&stable=1&os=macos&arch=#{arch}"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Zed.app"
  binary "#{appdir}/Zed.app/Contents/MacOS/cli", target: "zed"

  zap trash: [
    "~/.config/zed",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/dev.zed.zed.sfl*",
    "~/Library/Application Support/Zed",
    "~/Library/Caches/dev.zed.Zed",
    "~/Library/Caches/Zed",
    "~/Library/HTTPStorages/dev.zed.Zed",
    "~/Library/Logs/Zed",
    "~/Library/Preferences/dev.zed.Zed.plist",
    "~/Library/Saved Application State/dev.zed.Zed.savedState",
  ]
end
