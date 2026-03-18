cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.11"
  sha256 arm:          "6f5a3467ed9caec4795bf78cd476507d9f870c7d57b86c945fcb338126772ffc",
         x86_64:       "c4fe2b9247218b0295f24e895aaec8fee62e74452679a9026b67eacbd611a286",
         arm64_linux:  "d13944da12a53ecc74bf6a720bd1d04c4555c038dfe422365356a7be47691fdf",
         x86_64_linux: "8611ba935af886f05a6f38740a15160326c15e5d5d07adef966130b4493607ed"

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
