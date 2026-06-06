cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.1"
  sha256 arm:          "e013ec98bf534c7c06a52c684b9d6a1255f2ed6b1f6fcbc2dbeba47eff54af45",
         x86_64:       "f688aebfc11496d995fec7f0d7a05c08ebd21b77cdec66e316508459aa77df36",
         arm64_linux:  "a80f72e2661128106f6b9496d0482d7f5a02ad0c80f69773a8c2406856012d1e",
         x86_64_linux: "81c974c7b9a7c489a143b8f0d482ac30788e8dd3e12e75d76609663350741f05"

  url "https://github.com/biliup/biliup/releases/download/v#{version}/biliupR-v#{version}-#{arch}-#{os}.tar.xz",
      verified: "github.com/biliup/biliup/"
  name "biliupR"
  desc "哔哩哔哩命令行投稿和视频下载工具"
  homepage "https://biliup.github.io/biliup/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "biliupR-v#{version}-#{arch}-#{os}/biliup", target: "biliup"
end
