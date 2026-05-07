cask "hunming" do
  arch arm: "arm64", intel: "amd64"
  os macos: "apple-darwin", linux: "linux"

  version "0.0.1"
  sha256 arm:          "00f37b3439fdb682835493b1bb95468bb7b3afed4b7052c2532cf85af33240ad",
         x86_64:       "a6112dc4cca6f86999f42a2550e3f27d4eac16dc055ae028169061ce42f3a9c1",
         arm64_linux:  "7428246a00ec120f449d228c73f735aec66abfe41fd39a9fb44998a318e03ebf",
         x86_64_linux: "7db254d76ae885e28ed908c5dd5d5af5555a065b174e8fafc24a4bed9a6e7b99"

  url "https://github.com/ivaquero/hunming/releases/download/v0.0.1/hunming-#{arch}-#{os}.tar.gz"
  name "hunming"
  desc "Cross-platform alias manager for Bash, Zsh, and PowerShell"
  homepage "https://github.com/ivaquero/hunming"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "hunming-#{arch}-#{os}/hunming", target: "hunming"
end
