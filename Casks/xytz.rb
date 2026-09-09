cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.9.3"
  sha256 arm:          "719649cec9cb531cc6dff3084e5dea3536194e44a2fe92fec9cbe49beb1242ae",
         x86_64:       "f3a90ef8f10e4b9411166d8706de1c107fa540aada1139e3f148682af9a5c068",
         arm64_linux:  "370411e3c03846e27d628b0e32c0afd3385caacea9d2531772a5a94af2f4e806",
         x86_64_linux: "3bf644e077147eee4c4d91f45f7a70b55377ce061c7e999595188d23d2a972c3"

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
