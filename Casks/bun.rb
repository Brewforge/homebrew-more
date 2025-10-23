cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.1"
  sha256 arm:          "ae89f29561133307515aa3dda5d5efdd1e9d26877ec85b4f1800013431aa98ed",
         x86_64:       "71036d00003d632396f117fa81589db9d22fc49cee1a5898c59f6e88ee50f0c3",
         arm64_linux:  "65666a18439e891e5751b666103fe591a8519f11b66ec4bd8654c5515d4fff8a",
         x86_64_linux: "400824c82bfcc0854365bcada11cf53d7384ecb1e2c3da0e2c0a2c6a527d5629"

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
