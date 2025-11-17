cask "ticker" do
  arch arm: "arm64", intel: "amd64"
  os macos: "mac", linux: "linux"

  version "5.1.0"
  sha256 arm:          "daad046185b6e460a8090cb53a830f9997c4034266a7feff9b37eb64242714c4",
         x86_64:       "793995a8c0ec4fec7855b3e80641d241a24f57f246982de937f1150307a9ada2",
         arm64_linux:  "2f107de6a98904f8f03df8ba308d11b4e202b913a69c514ea43d6d6d1ed69957",
         x86_64_linux: "1bf692a7c9cd1a9780ec7b9328ae985b78899bcc6dbca3583a050a3b8bc2c731"

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
