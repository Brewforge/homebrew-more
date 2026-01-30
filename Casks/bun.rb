cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.8"
  sha256 arm:          "672a0a9a7b744d085a1d2219ca907e3e26f5579fca9e783a9510a4f98a36212f",
         x86_64:       "4a0ecd703b37d66abaf51e5bc24fd1249e8dc392c17ee6235710cf51a0988b85",
         arm64_linux:  "4e9deb6814a7ec7f68725ddd97d0d7b4065bcda9a850f69d497567e995a7fa33",
         x86_64_linux: "0322b17f0722da76a64298aad498225aedcbf6df1008a1dee45e16ecb226a3f1"

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
