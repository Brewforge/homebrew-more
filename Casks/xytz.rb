cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.8.4"
  sha256 arm:          "2462bef0918b9cd321ee7d74f372bc219110d37f27d300effdf9e6bed3c60059",
         x86_64:       "19030579fe89ca0131366cf1e41a6faa132e9b664fc19aea1c1a3be88ba318e1",
         arm64_linux:  "a3b482caae38231eef63474a5fcf9b478f7f63e5f603e87890dc51db40ea183c",
         x86_64_linux: "41765aa64c31c2ab3356cbe4f67a005068f8024be567ad5325e22304af782409"

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
