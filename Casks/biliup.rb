cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.3"
  sha256 arm:          "499d8b13054e3f563ac8830955a11bae7c889677e2ba3a27f4adf70430c9c264",
         x86_64:       "d28290644382ee6d88c2b14f250eec55cb2487abb6a48b84d0f2824aeab7784d",
         arm64_linux:  "eeaeddb62a5cbc342ca1aee0e7353e18c8b345214cfe80849c0e19f6889d7fda",
         x86_64_linux: "8e298ee597cec18b38bcaae3a06cfa2fc478fcd55ba2403271c9db83182b08eb"

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
