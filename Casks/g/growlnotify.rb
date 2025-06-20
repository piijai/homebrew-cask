cask "growlnotify" do
  version "2.1"
  sha256 "eec601488b19c9e9b9cb7f0081638436518bce782d079f6e43ddc195727c04ca"

  url "https://growl.cachefly.net/GrowlNotify-#{version}.zip",
      verified: "growl.cachefly.net/"
  name "GrowlNotify"
  desc "Notification system"
  homepage "https://growl.github.io/growl/"

  no_autobump! because: :requires_manual_review

  disable! date: "2024-12-16", because: :discontinued

  pkg "GrowlNotify.pkg"

  uninstall pkgutil: "info.growl.growlnotify.*pkg"
end
