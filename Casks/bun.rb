cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.4"
  sha256 arm:          "8803774e4c6c55c8a517464c508f02821e6db57f94ca1bb5cc2a39f4d2326a51",
         x86_64:       "3390f9e6a82a9c718e187513b1c56405d0de9ed3f6b092222b15b4d4ba6e304d",
         arm64_linux:  "c46e841fed85347521915b1b3904d6d175d8e2fd915e18e01c111318219115a4",
         x86_64_linux: "33c6996049e8d37e8b815959b14b05e5b6f496121352bf11bae7d047193c28bf"

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
