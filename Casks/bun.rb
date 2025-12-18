cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.5"
  sha256 arm:          "db17588a4aea8804856825d4bead3f05e1f37276ca606f37e369b4f72f35d3fb",
         x86_64:       "f5ffc03030fe527a86295fb5852bb08c5e99b707560011d1d509ab028902bf29",
         arm64_linux:  "ed01000f85bd97785228ad2845dc92a1860b8054856826d7317690ac8f8ee74b",
         x86_64_linux: "7051d86a924aefea3e0b96213b5fd8f79c0793f9cae6534233e627e5c3db4669"

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
