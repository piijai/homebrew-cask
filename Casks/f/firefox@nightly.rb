cask "firefox@nightly" do
  version "150.0a1,2026-02-25-21-31-26"

  language "ca" do
    sha256 "7bc39f4c093439f1c5345f91030bc956025e99e603875f5249bc9f5f8659fb60"
    "ca"
  end
  language "cs" do
    sha256 "fb577b7283468a8a6b217cdc6ecda049c6d0a656e99b73db2b41f32c621e8d65"
    "cs"
  end
  language "de" do
    sha256 "ba91f59f666c88e11b45bc24ef5ce59bbd7af77ebbf7104ded2c0ed4e1ad1c27"
    "de"
  end
  language "en-CA" do
    sha256 "8f4b79b876f221774d08c2f6b4b15ce58b0da44340c5addf04146477dbf16d4a"
    "en-CA"
  end
  language "en-GB" do
    sha256 "8770cae3bd6e14a5bb2612572914c7bb62b54c49455240087011bcdf851d25cc"
    "en-GB"
  end
  language "en", default: true do
    sha256 "41996afa9883a53fa3a22e8fded7672f4e24dc7fd14818a0d0e170802524cf80"
    "en-US"
  end
  language "es" do
    sha256 "4d873b934ed6b2b46da953029f86dd4f7e9dcc1e7a284be92fa41ad0ffd2a475"
    "es-ES"
  end
  language "fr" do
    sha256 "59c38f985a4133645819ad8608456456c52d44cbd5a27f22f98b7b55f8f4e601"
    "fr"
  end
  language "it" do
    sha256 "d70debef1c5aa408087af6deca54438352c86aef3bad126b90faad23eb545be0"
    "it"
  end
  language "ja" do
    sha256 "02d6fbd178e88054f84e8618baeef85e397e24f86af5a2de3938571d2860d57b"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "7c0c45d37d338cf86f0ebc59836307d9b27339d63a2e5483ed0944f773a32429"
    "ko"
  end
  language "nl" do
    sha256 "f709842521e402ea5e08039fa6e402397f3fba424124546363563c77ffacdb38"
    "nl"
  end
  language "pt-BR" do
    sha256 "1228161b646b1ed236319ca766fb45ee320a5ec960b4f21c9371d767f65afb81"
    "pt-BR"
  end
  language "ru" do
    sha256 "a41c47f59c39c98f3aa9443f7553407b0d404dd1e11b789c711519dd5a1508bd"
    "ru"
  end
  language "uk" do
    sha256 "7fa403f76553f98c823cc0c188ffac2f25321d9dee6b5b21cbf79f3407787d5c"
    "uk"
  end
  language "zh-TW" do
    sha256 "7d7661dcc68aa66f2c9aed6ff75bcf4badf56c17bb99a478c8af6c7f49e68f4f"
    "zh-TW"
  end
  language "zh" do
    sha256 "f53710f91d6fb06f6e6e0a21b8b57f86193fb14c7468a942c16539baeb6f21ed"
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
