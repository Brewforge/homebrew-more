cask "czkawka-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "mac", linux: "linux"

  version "10.0.0"
  sha256 arm:          "c3a57d0776168b92b254675b0127f7e5056f4ed016698691cbc98a47504da3b6",
         x86_64:       "cee55344343cb0130031cdb72931d97f287ee7e3b6eff8d6e43a86f31c1ea40c",
         arm64_linux:  "6123c556e788c1a767d0ae03fc1ad647c827d1d1a6ecc6b425f8be73ddf994a1",
         x86_64_linux: "b261aba0ca0b1d99d450949be22f9ae172750fe13dc9b40a32209fc8db0fc159"

  url "https://github.com/qarmin/czkawka/releases/download/#{version}/#{os}_czkawka_cli_#{arch}"
  name "czkawka"
  desc "Duplicate file utility"
  homepage "https://github.com/qarmin/czkawka"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "brewforge/more/czkawka-gui"

  binary "#{os}_czkawka_cli#{arch}", target: "czkawka"
end
