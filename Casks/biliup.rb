cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.4"
  sha256 arm:          "f2341fbb2c95be4f0934d070d13e3891ff83a68fa35c20bcebc5518bee7cf15b",
         x86_64:       "3da265358b84aff2497936cad0fdeec718987b1b955fd1a04637c145e824f1d2",
         arm64_linux:  "902b4e45f1b1e5b097b598c420c256c1378c7d5fbbd079291e77a472d8e0667e",
         x86_64_linux: "428e3365357d495884111787bf27f10c6abc8d981502f336acf542e7361dae0e"

  url "https://github.com/biliup/biliup/releases/download/v#{version}/biliupR-v#{version}-#{arch}-#{os}.tar.xz",
      verified: "github.com/biliup/biliup/"
  name "biliupR"
  desc "哔哩哔哩命令行投稿和视频下载工具"
  homepage "https://biliup.github.io/biliup/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "biliupR-v#{version}-#{arch}-#{os}/biliup", target: "biliup"
end
