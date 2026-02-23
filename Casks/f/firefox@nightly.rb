cask "firefox@nightly" do
  version "149.0a1,2026-02-23-09-16-13"

  language "ca" do
    sha256 "67eae0da18b7a705edf22540d2a67002cb369e29b22256566a51f7f767e03459"
    "ca"
  end
  language "cs" do
    sha256 "9d9f24441fffa71633f7897c07f2ba71660b2da9b02344571a8ddce05d337efb"
    "cs"
  end
  language "de" do
    sha256 "7e11ea48510585bd27f7bea308d8447635f6f6439d5fce705e25d9799f6e9f51"
    "de"
  end
  language "en-CA" do
    sha256 "6b53c2106ea0a48d939e26d74bce27545cbb80dd1f2f18674fe623821e3821b6"
    "en-CA"
  end
  language "en-GB" do
    sha256 "9c8a648ef66a360e2f4fb703776eb7858e12e972746090ab138573717e7d3cd6"
    "en-GB"
  end
  language "en", default: true do
    sha256 "556ef73f4763c386d5fe287d127c5e3a9a293cea1bacb56b2057558196719309"
    "en-US"
  end
  language "es" do
    sha256 "b997da050dc42ec90c6ff8989a44591a8870746b759285adedf69b41d60a92cf"
    "es-ES"
  end
  language "fr" do
    sha256 "954c77acf888c0f051e964bbc7db00e2ccca48a08bbc4d5672fa7085b26c82f4"
    "fr"
  end
  language "it" do
    sha256 "c4b9114b7f0346a6f7feebe8a45774af0f00b35a8ac064754021c6a0c080b2ac"
    "it"
  end
  language "ja" do
    sha256 "fed1ad6d8afd29749de4f247643ece14d95ccd4f178bc27598c918cccbed08dd"
    "ja-JP-mac"
  end
  language "ko" do
    sha256 "4f322997ad4262fe3f3966a6f713c9f567ea5b2e983573f6a821b689ed6267f6"
    "ko"
  end
  language "nl" do
    sha256 "80c639035245ff2842b964aef591ac965a9c1fa47b382e816c98f77d9fc41598"
    "nl"
  end
  language "pt-BR" do
    sha256 "65e8beccf5a53cd69116f05dc4aa1c0b873dd91cd2212efce41eded10ca24183"
    "pt-BR"
  end
  language "ru" do
    sha256 "0b0ec58398f205427d5e0d55e777241004ccbce43604d4c8bd21f8032b995867"
    "ru"
  end
  language "uk" do
    sha256 "94e8beaf449faf4a3c4fda1373536e0104283148ffee5f25300e8c4f4094c6e8"
    "uk"
  end
  language "zh-TW" do
    sha256 "fc38aecbbbe56fc2b269275d22a371e1cf0e5ef9c680e559048404a35cf84200"
    "zh-TW"
  end
  language "zh" do
    sha256 "19048c990566cdf1a29f664f571e244c327e4c19702697774a93471b7a21c7fe"
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
