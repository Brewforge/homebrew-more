cask "ticker" do
  arch arm: "arm64", intel: "amd64"
  os macos: "mac", linux: "linux"

  version "5.2.1"
  sha256 arm:          "cf9a68720732be2743f17e77a8b9205e639ccedd2ab262b7d2260cfa530b7dc4",
         x86_64:       "2b8012ffe4f75575e98113a73ec3b036b4cbcccedc7cd6fa1fe988d1d29fbd10",
         arm64_linux:  "69058bceec7cc72b6628ab01d6f0231020b4147639795dfcf34c8ecaa88bce72",
         x86_64_linux: "6c61882de840d20db449c77b4830cab945c44fd811f5f05b333160adab9098a4"

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
