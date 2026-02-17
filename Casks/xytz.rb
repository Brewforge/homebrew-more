cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.8.3"
  sha256 arm:          "a29e333b986b959ce05df4a2b3cc46ab60f4f46c66ab9965191c730a32509bff",
         x86_64:       "f01909d3a5b22ebb69424a8b8cdc8d33536a4dcb724cab5c1edfa12ac9df6aab",
         arm64_linux:  "0a105a9644a896ea1e5a1840911c84441f86b9bc60b48f309672f4cc717c34b4",
         x86_64_linux: "c8cda38d4f9164d2995f32a08764fb393fdcc4d4d96343d70fdf4120b1224ab3"

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
