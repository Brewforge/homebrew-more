cask "easytier-app" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "2.4.5"
  sha256 arm:          "ddf94b070f84d899504ad154666ea3f0369be6cc4da375a2d98143a312daef01",
         intel:        "282abe285e7802c74e2ef1dfb0186c794c371d8350f4f5b1d6ade12031b82333",
         arm64_linux:  "df08c842f2ab2b8e9922f13c686a1d0f5a5219775cfdabb3e4a8599c6772201f",
         x86_64_linux: "d33d1fe6e06fae6155ca7a6ea214657de8d29c4edd5e16fb51f128bef29d3aec"

  url "https://github.com/EasyTier/EasyTier/releases/download/v#{version}/easytier-#{os}-#{arch}-v#{version}.zip",
      verified: "github.com/EasyTier/EasyTier/"
  name "EasyTier"
  desc "Simple, decentralized mesh VPN with WireGuard support"
  homepage "https://easytier.cn/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "easytier-#{os}-#{arch}/easytier-cli"
  binary "easytier-#{os}-#{arch}/easytier-core"
  binary "easytier-#{os}-#{arch}/easytier-web"
  binary "easytier-#{os}-#{arch}/easytier-web-embed"
end
