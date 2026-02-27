cask "conductor" do
  arch arm: "aarch64", intel: "x86_64"

  on_arm do
    version "0.36.5,01KJE8BP1N14WAFT176X2GXH1Z"
    sha256 "1c8b35a1d56f916e0c015fba02467a6b028355eb78e001cebd6e9fe0ac724fee"
  end
  on_intel do
    version "0.36.5,01KJE8BD05JNDBPEB7DVRJNM0B"
    sha256 "635481706183c8a9db4bd5217b7a1fea1a390f103328fcde1fecdf8287c60e9f"
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
