cask "czkawka-gui" do
  arch arm: "_arm", intel: ""
  os macos: "mac", linux: "linux"

  version "9.0.0"
  sha256 arm:          "725cb58f3d07f45ed50b3d82312ef3fd5dc8734f9030082414d02916e4289f07",
         x86_64:       "bb3137e0317ce1bc62f931a478121755e8f580eaf1094f2e9028617d0fdb919e",
         arm64_linux:  "b78ea29da65d5c9a81278e9ec58d74be18c9fa084bbb2fad724d39fc7b3ebc46",
         x86_64_linux: "b7b9a9c0779015b94e046e2cb242b99296fc290b5b1e5fdbdeeec1cfbad3150a"

  url "https://github.com/qarmin/czkawka/releases/download/#{version}/#{os}_czkawka_gui#{arch}"
  name "czkawka"
  desc "Duplicate file utility"
  homepage "https://github.com/qarmin/czkawka"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "brewforge/more/czkawka-cli"
  depends_on formula: "gtk4"

  binary "#{os}_czkawka_gui#{arch}", target: "czkawka"
end
