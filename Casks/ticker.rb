cask "ticker" do
  arch arm: "arm64", intel: "amd64"
  os macos: "mac", linux: "linux"

  version "5.3.0"
  sha256 arm:          "44204575e0f49387572dc50c61c365f22f9e6fc33a24e5200381c54decded71a",
         x86_64:       "bc764ccb3681fcdb996bf342c7344696774621a1873be6ed5c31275d61de3695",
         arm64_linux:  "98f1316362cd48a2a235bb2088fc8b7514e58aaeb6b3a3992e0b70facfde94ca",
         x86_64_linux: "fa4991f1c963559d0a27dec6ddc35cff411954a6f62ae3c2c3dc24d9ffedc12a"

  url "https://github.com/achannarasappa/ticker/releases/download/v#{version}/ticker-#{version}-#{os}-#{arch}.tar.gz"
  name "ticker"
  desc "Terminal stock ticker with live updates and position tracking"
  homepage "https://github.com/achannarasappa/ticker"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "ticker"
end
