cask "gotmail" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.3.1"
  sha256 arm:          "d182c6fd408ede1301a56d3d925886d5200a463cdff6f52c5b7c1f1f7a969ff9",
         x86_64:       "f316799d6807f94c65fcb9b5599f5303a0273b976a143dedb7e9f405451453b8",
         arm64_linux:  "b5f62b5c0596357ccdf04e9c9f25c42b4128c1375c09bfeb327f7cbe8472fb6c",
         x86_64_linux: "e10da58949cffca4d4a53e4f2b80c4c0e9c17750902dd3a47572c6d18cf8879f"

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
