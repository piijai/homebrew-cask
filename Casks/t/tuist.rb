cask "tuist" do
  version "4.151.0"
  sha256 "7fb10978b1078485f32f6541115dec867ef275f66454dcb749d142e300240c8e"

  url "https://github.com/tuist/tuist/releases/download/#{version}/tuist.zip",
      verified: "github.com/tuist/tuist/"
  name "Tuist"
  desc "Create, maintain, and interact with Xcode projects at scale"
  homepage "https://tuist.io/"

  binary "tuist"

  zap trash: "~/.tuist"
end
