cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.3.3"
  sha256 arm:          "5fe964e0220f2ddb61aee2d301d46236ef89dede84a32e9fea1d986caa2aa7af",
         x86_64:       "78b9ca298b4a56d3c58803bc036a56da2f3eb5a402c558ec9c7b5f79b01a1ccc",
         arm64_linux:  "3745af55fbf3d1154f50c2990e0e6ad563eb1fd3d5ad8108fa92f1b6c91aac4c",
         x86_64_linux: "c1996c4beaf122ff505ea35b14764b72caad4d084b0d0584174b8d03a9f28d93"

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
