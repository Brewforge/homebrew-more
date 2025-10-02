cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.2.23"
  sha256 arm:          "22f5fa3fff72b0d3b8e7e0f8051ecadf2e41920d474ac62db5279144809c9005",
         x86_64:       "9729c400e50bc3c86b6640e42af2ff5c057b5df3b27c93b40ed47c16b5e6a5e6",
         arm64_linux:  "30b7573bb99929843e65498d93ef2f0d5f2c0e8cd96c7853081395a9463b86b1",
         x86_64_linux: "cf0ed0a920799d576ffde4e0cae66d732bf23c2530407f26f59c7831dffe1f0e"

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
