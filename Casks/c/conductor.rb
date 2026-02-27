cask "conductor" do
  arch arm: "aarch64", intel: "x86_64"

  on_arm do
    version "0.36.6,01KJG4S7KQXCSQASVJ0D5N5BK4"
    sha256 "3dbaa60aba5b66a9f9939fb6d842533c954e2a89467c84890ac7ac9cd590ce6b"
  end
  on_intel do
    version "0.36.6,01KJG4QFNGW1DS2RBC4YYHK0BG"
    sha256 "afc4585e7b91791c80a49b35446cefdf00aada15048f6df72c2b0763fd059b14"
  end

  url "https://cdn.crabnebula.app/asset/#{version.csv.second}",
      verified: "cdn.crabnebula.app/asset/"
  name "Conductor"
  desc "Claude code parallelisation"
  homepage "https://conductor.build/"

  livecheck do
    url "https://cdn.crabnebula.app/update/melty/conductor/darwin-#{arch}/latest"
    regex(%r{cdn.crabnebula.app/asset/(.+)}i)
    strategy :json do |json, regex|
      asset_id = json["url"]&.[](regex, 1)
      version = json["version"]
      next if asset_id.blank? || version.blank?

      "#{version},#{asset_id}"
    end
  end

  auto_updates true

  app "Conductor.app"

  zap trash: [
    "~/Library/Application Support/com.conductor.app",
    "~/Library/Caches/com.conductor.app",
    "~/Library/WebKit/com.conductor.app",
  ]
end
