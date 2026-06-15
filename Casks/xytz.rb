cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.9.0"
  sha256 arm:          "85b1d3ecc8e769b2dfd24d537ff84e26593fa9e6aeb94f69b96488d2005f5be1",
         x86_64:       "e20c43e5fcc6ac82493d85368e16e91461b1bf49a922afad83287a7b352fa1bc",
         arm64_linux:  "872716ded92b0391c51342b9bf342c812d38124ba5fbf33d6fde171dcaf51730",
         x86_64_linux: "78922ab0ba2d3cd687238976aa9df09f88a05c166b4d708f040a3423fe29bc5e"

  url "https://github.com/xdagiz/xytz/releases/download/v#{version}/xytz-v#{version}-#{os}-#{arch}.tar.gz"
  name "xytz"
  desc "Beautiful TUI YouTube Downloader app"
  homepage "https://github.com/xdagiz/xytz"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "xytz"
end
