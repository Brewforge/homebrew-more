cask "bun" do
  arch arm: "aarch64", intel: "x64"
  os macos: "darwin", linux: "linux"

  version "1.3.0"
  sha256 arm:          "85848e3f96481efcabe75a500fd3b94b9bb95686ab7ad0a3892976c7be15036a",
         x86_64:       "09d54af86ec45354bb63ff7ccc3ce9520d74f4e45f9f7cac8ceb7fac422fcc19",
         arm64_linux:  "68b7dcd86a35e7d5e156b37e4cef4b4ab6d6b37fd2179570c0e815f13890febd",
         x86_64_linux: "60c39d92b8bd090627524c98b3012f0c08dc89024cfdaa7c9c98cb5fd4359376"

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
