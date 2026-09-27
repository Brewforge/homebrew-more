cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.10"
  sha256 arm:          "213856df69c2334c8dd0eb42b044a8f813874b5ba4fde693b382ca1d64c7a808",
         x86_64:       "a660f4125f0f98d28b1fee4d46673990f5117e824775925fcee0aadd9413d4f2",
         arm64_linux:  "00b8511fb08b736bffb7cdac9563f8f11a84cfe4a2d071475dc33ad226312395",
         x86_64_linux: "ff043d8316d208cd873b8a257dd25e558609f3c3a6d6830806903914aa4d1eea"

  url "https://github.com/biliup/biliup/releases/download/v#{version}/biliupR-v#{version}-#{arch}-#{os}.tar.xz"
  name "biliupR"
  desc "哔哩哔哩命令行投稿和视频下载工具"
  homepage "https://biliup.github.io/biliup/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "biliupR-v#{version}-#{arch}-#{os}/biliup", target: "biliup"
end
