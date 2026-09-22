cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.6"
  sha256 arm:          "f91454a07f0396037acc4ab355fec1e494d4b92e71527308b98fdfa48bba1303",
         x86_64:       "535713f28d532053e8260a042c845d3032a7d02febf3642ff9fa7c195fe4d22b",
         arm64_linux:  "7a2ed6169afa06e924ed50d0420a453ed1865054ef5750529f754a56046b060f",
         x86_64_linux: "9308bd038c53e17ddff72904294b78414c6370a1f5f5628544e6720c1531a0d2"

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
