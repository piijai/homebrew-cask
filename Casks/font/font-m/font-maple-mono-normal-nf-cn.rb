cask "font-maple-mono-normal-nf-cn" do
  version "7.5"
  sha256 "d3eee9ae7b04fb70c8f035435a580605320aa533e876bda67916b66f6c736a7e"

  url "https://github.com/subframe7536/Maple-font/releases/download/v#{version}/MapleMonoNormal-NF-CN-unhinted.zip",
      verified: "github.com/subframe7536/Maple-font/"
  name "Maple Mono Normal NF CN"
  homepage "https://font.subf.dev/en/"

  livecheck do
    cask "font-maple-mono"
  end

  font "MapleMonoNormal-NF-CN-Bold.ttf"
  font "MapleMonoNormal-NF-CN-BoldItalic.ttf"
  font "MapleMonoNormal-NF-CN-ExtraBold.ttf"
  font "MapleMonoNormal-NF-CN-ExtraBoldItalic.ttf"
  font "MapleMonoNormal-NF-CN-ExtraLight.ttf"
  font "MapleMonoNormal-NF-CN-ExtraLightItalic.ttf"
  font "MapleMonoNormal-NF-CN-Italic.ttf"
  font "MapleMonoNormal-NF-CN-Light.ttf"
  font "MapleMonoNormal-NF-CN-LightItalic.ttf"
  font "MapleMonoNormal-NF-CN-Medium.ttf"
  font "MapleMonoNormal-NF-CN-MediumItalic.ttf"
  font "MapleMonoNormal-NF-CN-Regular.ttf"
  font "MapleMonoNormal-NF-CN-SemiBold.ttf"
  font "MapleMonoNormal-NF-CN-SemiBoldItalic.ttf"
  font "MapleMonoNormal-NF-CN-Thin.ttf"
  font "MapleMonoNormal-NF-CN-ThinItalic.ttf"

  # No zap stanza required
end
