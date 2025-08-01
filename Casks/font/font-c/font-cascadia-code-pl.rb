cask "font-cascadia-code-pl" do
  version "2407.24"
  sha256 "e67a68ee3386db63f48b9054bd196ea752bc6a4ebb4df35adce6733da50c8474"

  url "https://github.com/microsoft/cascadia-code/releases/download/v#{version}/CascadiaCode-#{version}.zip"
  name "Cascadia Code PL"
  homepage "https://github.com/microsoft/cascadia-code"

  livecheck do
    url :url
    strategy :github_latest
  end

  no_autobump! because: :requires_manual_review

  font "ttf/CascadiaCodePL.ttf"
  font "ttf/CascadiaCodePLItalic.ttf"

  # No zap stanza required
end
