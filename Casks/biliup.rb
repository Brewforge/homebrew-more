cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.2"
  sha256 arm:          "9024475ed37c6e3c15a4da5c47983e2b764863bde42f9424dbd468f7dc169e6e",
         x86_64:       "f33106c5228ea7817c4618f36d8bbad54f3af978c0a42291bc24ae33758e1eeb",
         arm64_linux:  "58aed378ef8d4f588113e0da4fe1423ef74ebdc5ed5d40d77a908eed81f87487",
         x86_64_linux: "2d257da5131e55157d6aad82cd6f30c6fdc971bf6fcee8741fc5539fca65903a"

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
