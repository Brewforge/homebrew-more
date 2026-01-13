cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.6"
  sha256 arm:          "2af1ec8437759ab05b3b0ea421fe9e22e6c705cb4cb0751c326982642dace8fa",
         x86_64:       "83ef84c2a9d25dfef6ba0b31be3d8a09952ef311c71feca4488a628e96c26706",
         arm64_linux:  "5afd12b366ba2d8297245cc29c039416334dd872152c1db02e5c8aa8c66e96b1",
         x86_64_linux: "9ba98d2134550d6690875b23a4f5c48e74b7cb267e8cc1b8f52605921c6c11ef"

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
