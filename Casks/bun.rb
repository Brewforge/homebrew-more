cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.7"
  sha256 arm:          "16701e494998e4764d49af2fbe62d25ec59cf3c79ee696eba1def2cfe9049d64",
         x86_64:       "cdfe9c71cacbdd9a73f098c3b050671957a7414e1321dfedd9a410d7794dae51",
         arm64_linux:  "d5c7d651423c2bc5ae3f92d36837ffb2ddc6ee91849672500b7fe8e5a5159fbc",
         x86_64_linux: "2bd2e0e0bdf09483be67a704607848ebe72c28420824e4ce772ce3da62c23d65"

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
