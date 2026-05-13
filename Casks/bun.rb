cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.14"
  sha256 arm:          "d8b96221828ad6f97ac7ac0ab7e95872341af763001e8803e8267652c2652620",
         x86_64:       "4183df3374623e5bab315c547cfa0974533cd457d86b73b639f7a87974cd6633",
         arm64_linux:  "a27ffb63a8310375836e0d6f668ae17fa8d8d18b88c37c821c65331973a19a3b",
         x86_64_linux: "951ee2aee855f08595aeec6225226a298d3fea83a3dcd6465c09cbccdf7e848f"

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
