cask "icc" do
  version "1.0,7648"
  sha256 "d512be0aaa6e7189f863b0b80bb4e8cc0fdf86c42bbdec13b8cd3e09218931dd"

  url "https://s3-us-west-2.amazonaws.com/download.chessclub.com/desktop/mac/ICCforMac.r#{version.csv.second}.pkg",
      verified: "s3-us-west-2.amazonaws.com/download.chessclub.com/"
  name "International Chess Club"
  desc "Chess club client"
  homepage "https://www.chessclub.com/"

  no_autobump! because: :requires_manual_review

  deprecate! date: "2024-09-11", because: :discontinued

  pkg "ICCforMac.r#{version.csv.second}.pkg"

  uninstall pkgutil: "com.chessclub.*"

  zap trash: [
    "~/.cache/internet_chess_club",
    "~/.internet_chess_club",
    "~/Library/Preferences/com.chessclub.desktop-icc",
    "~/Library/Saved Application State/com.chessclub.desktop-icc.savedState",
  ]
end
