cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.8.8"
  sha256 arm:          "773e355df0fbdee44eb691e7635196856d7885ada9391d07be00e4d3c71eb92c",
         x86_64:       "7edb96c7fed03d3400a38aada7790d873d38349976070bb3819a29bcd29b8732",
         arm64_linux:  "00d38dfdf86e654be627af0a85f3a5d5280c32b2790794aadd81db80abaf2171",
         x86_64_linux: "6fc6c08a398b7137a584413e52921e62c5ca1d4be4a2da54f17683b94bda56ce"

  url "https://github.com/xdagiz/xytz/releases/download/v#{version}/xytz-v#{version}-#{os}-#{arch}.tar.gz"
  name "xytz"
  desc "Beautiful TUI YouTube Downloader app"
  homepage "https://github.com/xdagiz/xytz"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "xytz"
end
