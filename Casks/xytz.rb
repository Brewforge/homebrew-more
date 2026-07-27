cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.9.2"
  sha256 arm:          "315ae245b1ed3264a4fbe1453217e5da178f138c01ceddac34bcd6eaddd08bc6",
         x86_64:       "675652e74f06a3f991c0c4afc742b520a3b1b6d3adcac0cdd07f292e399df3d2",
         arm64_linux:  "058799df46e69f84c3506038280c03a63a690cdc3c8bd4def7162d70db3b37a2",
         x86_64_linux: "2d1a1ced7c2eac8c37d3c1359685e390d8646afd24b03c1b996135f8c113b02a"

  url "https://github.com/xdagiz/xytz/releases/download/v#{version}/xytz-v#{version}-#{os}-#{arch}.tar.gz"
  name "xytz"
  desc "Beautiful TUI YouTube Downloader app"
  homepage "https://github.com/xdagiz/xytz"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "xytz"
end
