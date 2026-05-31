cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.8.9"
  sha256 arm:          "cdef4262eba2db356d6dc47943268083761801c32a7eb8c7b4e4b7e803307c61",
         x86_64:       "576ce8961dff017816a0cb238af3bc7a3b1d419dcfa09263fa3c6420e1e2ff39",
         arm64_linux:  "e718562f433d1e72d4f0ee35f33291ed61da133e585c978c25152425c00973a5",
         x86_64_linux: "bfa5b00c37018efb41fa957416a7cb38597ce7fc6753092b4e85ad2ffb38e990"

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
