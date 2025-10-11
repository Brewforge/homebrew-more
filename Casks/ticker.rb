cask "ticker" do
  arch arm: "arm64", intel: "amd64"
  os macos: "mac", linux: "linux"

  version "5.0.7"
  sha256 arm:          "98858948f200dc4ba097dff84ed180d088487c5f2cf5a9b6b2819ce4fd7f1fdc",
         x86_64:       "2515665df485de4d072fb94479b43901f526d665b30c3f8399e967113b299917",
         arm64_linux:  "7ce237b20d4df83a87cb3a08446f10c9c5f08e434edad62daaaae006c46cd04b",
         x86_64_linux: "60e0f8d366f9c0ed26ac5435ec4948f2a617cdd1efff3de3f3bc03e26cafab27"

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
