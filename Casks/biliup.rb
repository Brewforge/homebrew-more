cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.7"
  sha256 arm:          "005292b6150391209763f010308fef282f1302a765dc71a7b68284f96d2af544",
         x86_64:       "1e34d8688f246bb7743a1426a1ac108ce812f61fb28d8f54821b9f149ee98f9b",
         arm64_linux:  "28062e881a82d2f22419841ad2877ffc7d8c919e6c943ca7bbf31f5c71e56fda",
         x86_64_linux: "4c404ff73121da2dff78642e52cb8c1ce6019f1f02cf7be8aaae7f32fae0e01b"

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
