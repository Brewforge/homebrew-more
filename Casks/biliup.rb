cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.1.29"
  sha256 arm:          "2039817193c1da25c7ba8b7dd7bd404f55313d477aa0e5c72915dcf65bcf0ff8",
         x86_64:       "677014d7229701be02cdb7236f529a680df84774fca01d30c48a9fc857fd5e7b",
         arm64_linux:  "9cbbd8f6cfd839c963f48b7d355ede19560a1125553b4519d518587eea7e6027",
         x86_64_linux: "a6035dd90cde48e96b339b820aa59a58cc51a1238c8ae27c50960bdf9576b3ac"

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
