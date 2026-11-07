cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.3.5"
  sha256 arm:          "b4c131791ef885fdfa96f0727d1270575d1bd55cb71de70bde3a81c27c820e32",
         x86_64:       "e9ac8a2093a3aa5b95d05d6da452d2560a9521644bde79a1f03da6bbfafba5d1",
         arm64_linux:  "5c7ec2b90d692f6e8cd8076146ae726f9b238231d37db3fd94878e52741af5a5",
         x86_64_linux: "5106c7710b1731d79eb61342d8fe16ac000115889455d037e978012d0f792e6f"

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
