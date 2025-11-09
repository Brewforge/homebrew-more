cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.2"
  sha256 arm:          "d85847982db574518130a45582bcf14d8e2be9610b66cb5046c20348578b0fe2",
         x86_64:       "78d4f0c8637427ac0be55639a697ff6a025e8eb940a6920ca508603c41a5a7b0",
         arm64_linux:  "fe38c13b6b6b450af4e4f0fb8e04b22eca53f9cd71068d1d1eebf4f4a44f02fb",
         x86_64_linux: "0cb56a4484bd7764a3eef9b9e67ab457840981287b46794974d1e6612cbf6709"

  url "https://github.com/oven-sh/bun/releases/download/bun-v#{version}/bun-#{os}-#{arch}.zip",
      verified: "github.com/oven-sh/bun/"
  name "bun"
  desc "All-in-one toolkit for JavaScript and TypeScript apps"
  homepage "https://bun.sh/"

  livecheck do
    url "https://github.com/oven-sh/bun/releases/latest"
    regex(%r{href=.*?/tag/bun-v?(\d+(?:\.\d+)+)["' >]}i)
  end

  auto_updates true

  binary "bun-#{os}-#{arch}/bun"
end
