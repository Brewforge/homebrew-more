cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.8.7"
  sha256 arm:          "f2896d492b754e76f3f76299bbbd14f89d7a5e2fae6933862534e9883468f848",
         x86_64:       "b06eee52c32768d8991fd2a219ad9a0b868c22394fbed66659be8a0888b258d2",
         arm64_linux:  "916acf739276d01533eb451eb389f2f4d2950ef0c8e2395eaadf03ac44951d50",
         x86_64_linux: "f56bd87c44b886b05f37c97998af4b21ca48b3a522e1841789d8c7d13f493d00"

  url "https://github.com/xdagiz/xytz/releases/download/v#{version}/xytz-v#{version}-#{os}-#{arch}.tar.gz"
  name "xytz"
  desc "Beautiful TUI YouTube Downloader app"
  homepage "https://github.com/xdagiz/xytz"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "xytz"
end
