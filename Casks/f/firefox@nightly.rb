cask "firefox@nightly" do
  version "150.0a1,2026-02-28-09-11-14"

  language "ca" do
    sha256 "ca53e0b8fb30c7602c69c342a171fb5d63b0a7d3baae2f46a470677067d81f87"
    "ca"
  end
  language "cs" do
    sha256 "d23fd6351f7103a52fa42c1274d021d482e2d33a170975ba99415a18f65e98b4"
    "cs"
  end
  language "de" do
    sha256 "500c1fd9fcd3407c5acd334f7cf61574385f5a51612bad03e261700b7dfdfd27"
    "de"
  end
  language "en-CA" do
    sha256 "65bb1683cbb70eddfd2161e53fe0557fa252c9d8a1c1aa1ff0f04434779be54e"
    "en-CA"
  end
  language "en-GB" do
    sha256 "a6e6d2ecc1cdb899eb10900b05c4dcf6485d3783981514f584ed72043507f6e0"
    "en-GB"
  end
  language "en", default: true do
    sha256 "541fcd224c6e2a14766ead09ca8c458c3372471dcc3b8821d897ed551f32b718"
    "en-US"
  end
  language "es" do
    sha256 "9f7cf100cdfdad1dc691fd397d5f91e853bbf19b44a20a9105788aec0a50b4d3"
    "es-ES"
  end
  language "fr" do
    sha256 "d1852896c8b49772de3678130b4053d0f9b486c25ec74152967773f8c3cf2508"
    "fr"
  end
  language "it" do
    sha256 "6c674f3ceebdb45d315c033dd6e8db453efb957a24f6debaad608d429cdfa446"
    "it"
  end
  language "ja" do
    sha256 "ee47481e21185dad118f540be28e479bf7f20f556c7d2a9b265e27285478b581"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "be52370097f9f30081c4042cdd707f3930a3b8eeaca1c0dc3bf17fbb34cefa28"
    "ko"
  end
  language "nl" do
    sha256 "1c810a6eacfd72e19aaed2b4abf1aee8cc3244bd608ffe59678a7da6a4c5a71e"
    "nl"
  end
  language "pt-BR" do
    sha256 "e5a8a7bf33c4ba8b50c080fa53dc6279c3e6f383f84606036d54bdad8aae63d8"
    "pt-BR"
  end
  language "ru" do
    sha256 "f283e72aa817a541bf9c3f3c478039f7c4e1e571016ccf332c086119ac780992"
    "ru"
  end
  language "uk" do
    sha256 "82765671b34fbe4f33096ec62129fd7cce8a3a1a2da52bf7112e45c1df06b30c"
    "uk"
  end
  language "zh-TW" do
    sha256 "c1cb51bb2fc48be0280098f3d32459499eb3db437dff1a3f6b2175e2cf348b1d"
    "zh-TW"
  end
  language "zh" do
    sha256 "415b56b236462401f6c22562dd871f4d3522bbba963bf412c06219e93864101b"
    "zh-CN"
  end

  url "https://ftp.mozilla.org/pub/firefox/nightly/#{version.csv.second.split("-").first}/#{version.csv.second.split("-").second}/#{version.csv.second}-mozilla-central#{"-l10n" if language != "en-US"}/firefox-#{version.csv.first}.#{language}.mac.dmg"
  name "Mozilla Firefox Nightly"
  desc "Web browser"
  homepage "https://www.mozilla.org/firefox/channel/desktop/#nightly"

  livecheck do
    url "https://product-details.mozilla.org/1.0/firefox_versions.json"
    regex(%r{/(\d+(?:[._-]\d+)+)[^/]*/firefox}i)
    strategy :json do |json, regex|
      version = json["FIREFOX_NIGHTLY"]
      next if version.blank?

      content = Homebrew::Livecheck::Strategy.page_content("https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central/firefox-#{version}.en-US.mac.buildhub.json")
      next if content[:content].blank?

      build_json = Homebrew::Livecheck::Strategy::Json.parse_json(content[:content])
      build = build_json.dig("download", "url")&.[](regex, 1)
      next if build.blank?

      "#{version},#{build}"
    end
  end

  auto_updates true

  app "Firefox Nightly.app"

  zap trash: [
        "/Library/Logs/DiagnosticReports/firefox_*",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/org.mozilla.firefox.sfl*",
        "~/Library/Application Support/CrashReporter/firefox_*",
        "~/Library/Application Support/Firefox",
        "~/Library/Caches/Firefox",
        "~/Library/Caches/Mozilla/updates/Applications/Firefox",
        "~/Library/Caches/org.mozilla.firefox",
        "~/Library/Preferences/org.mozilla.firefox.plist",
        "~/Library/Saved Application State/org.mozilla.firefox.savedState",
        "~/Library/WebKit/org.mozilla.firefox",
      ],
      rmdir: [
        "~/Library/Application Support/Mozilla", #  May also contain non-Firefox data
        "~/Library/Caches/Mozilla",
        "~/Library/Caches/Mozilla/updates",
        "~/Library/Caches/Mozilla/updates/Applications",
      ]
end
