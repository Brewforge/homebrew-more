cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.5"
  sha256 arm:          "4aac070b0cf9e1e2b2006f078be68c7bf67a1c4268d32fcb06f0752914a0557e",
         x86_64:       "5fe62e201783d1513a5419960214ca8a2d80330b54b05edf6e0c244eba80ea3e",
         arm64_linux:  "707d58e546f01356abfd0325106a5580eaa0eeb9caa847f334beb1a7dde54d39",
         x86_64_linux: "a77213a9d8786e95ddc90acb2b597d06160671f2a7ff6f7d7a920d64c143625a"

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
