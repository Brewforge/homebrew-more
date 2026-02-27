cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.10"
  sha256 arm:          "82034e87c9d9b4398ea619aee2eed5d2a68c8157e9a6ae2d1052d84d533ccd8d",
         x86_64:       "c1d90bf6140f20e572c473065dc6b37a4b036349b5e9e4133779cc642ad94323",
         arm64_linux:  "fa5ecb25cafa8e8f5c87a0f833719d46dd0af0a86c7837d806531212d55636d3",
         x86_64_linux: "f57bc0187e39623de716ba3a389fda5486b2d7be7131a980ba54dc7b733d2e08"

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
