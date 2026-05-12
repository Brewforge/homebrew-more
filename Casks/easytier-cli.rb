cask "easytier-cli" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "2.6.4"
  sha256 arm:          "4be1882d1aa36d31c1d6ba0596f2cf8a097e371f8da124212324b2e0f8df7e4b",
         intel:        "89fc28a6e6995259d76ce3f11775220e8a21c760e94df91a6a9db30a69b6982e",
         arm64_linux:  "f533ec25a7ea714e09f645615012200278058525795cc3bb690ff011aec1a70f",
         x86_64_linux: "61b659eaedba658fa66fe47d17e1426cdd77e5d02fa15fed447bb4357c09dfd6"

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
