cask "ticker" do
  arch arm: "arm64", intel: "amd64"
  os macos: "mac", linux: "linux"

  version "5.0.5"
  sha256 arm:          "8bba59b765dc7f40e577ad29f7bbc6c287daf3cd3e57e7d81fa44826eeaca92a",
         x86_64:       "ad15052853484f24ad76cca90664b63bdf2d51291746a56d78d8c2ec156b1962",
         arm64_linux:  "beaf996fb90b4f82d2a574d9e09bd1a589ca8a9efe672cbfbced3148ed9a6d3b",
         x86_64_linux: "6f52ae8b1140d3d072002108d4f6dbbcdb42717c1386cd5d99f8de201720770e"

  url "https://github.com/achannarasappa/ticker/releases/download/v#{version}/ticker-#{version}-#{os}-#{arch}.tar.gz"
  name "ticker"
  desc "Terminal stock ticker with live updates and position tracking"
  homepage "https://github.com/achannarasappa/ticker"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "ticker"
end
