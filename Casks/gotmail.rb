cask "gotmail" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.3.0"
  sha256 arm:          "95ce346b7071ece1c9d1d444727f6eda590f13b338089d8d2676b7171f767bf9",
         x86_64:       "24910af11f73f9d666635fe4974fe5a14b1ca726b30e6ceba102f7f54d90d664",
         arm64_linux:  "60a157c53d7dd03af8384727ef246e181164f3f726784554284e9786a492b159",
         x86_64_linux: "1423bee9ea407268528c440f661484ef9dbbf0d5e498236afaa8f87e350f2acc"

  url "https://github.com/ivaquero/gotmail/releases/download/v#{version}/gotmail_#{version}_#{os}_#{arch}.tar.gz"
  name "gotmail"
  desc "Terminal stock gotmail with live updates and position tracking"
  homepage "https://github.com/ivaquero/gotmail"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "gotmail"
end
