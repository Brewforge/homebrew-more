cask "ticker" do
  arch arm: "arm64", intel: "amd64"
  os macos: "mac", linux: "linux"

  version "5.2.0"
  sha256 arm:          "476637f0cc709e3e66fe8a452a718dc7f9c8f0d9f45c71273ce807c30b279107",
         x86_64:       "99ab53038377c3be0ec72c1183df9cf4aee1d51820c18ca8633c2de9f384f026",
         arm64_linux:  "fc257b25afd4a80b292dbd6cae481590b17d576e95de5dcde07426a9e9b02945",
         x86_64_linux: "79838ff5410a46f3e6e926dd6117499a4db7438cd6d9be56c633cfa7208ecdc6"

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
