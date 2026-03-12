cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.8.6"
  sha256 arm:          "4c40a447ed89767297c5c871fcf34f3b3d82fd238286de48a55de2c269e02faf",
         x86_64:       "1eb8e4283495c1b3819d0d5bc7b3b19e39f068a98ab9e1104782b39168fe93c9",
         arm64_linux:  "f425ccceba09c36862a031f712418bdccdd74e73c922dd60337148b0db9723cc",
         x86_64_linux: "8a2013545ab7c8fe324d4a3235d1f5cd463f1901c00e9b6aaf70e950a9eea88c"

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
