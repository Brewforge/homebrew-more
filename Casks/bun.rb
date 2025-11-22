cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.3"
  sha256 arm:          "f50f5cc767c3882c46675fbe07e0b7b1df71a73ce544aadb537ad9261af00bb1",
         x86_64:       "fdaf5e3c91de2f2a8c83e80a125c5111d476e5f7575b2747d71bc51d2c920bd4",
         arm64_linux:  "41b9f4f25256db897c2c135320e4f96c373e20ae6f06d8015187dac83591efc8",
         x86_64_linux: "f5c546736f955141459de231167b6fdf7b01418e8be3609f2cde9dfe46a93a3d"

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
