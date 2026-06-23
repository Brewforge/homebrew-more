cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.9.1"
  sha256 arm:          "958f4b696ad2a5d11537b5c1205683ca778420c00f067065e1ef6278718a3907",
         x86_64:       "df7add25d04ad13a2dd0ee7f69cc93ef0855114bb928efc0947d9bcfa871d3d5",
         arm64_linux:  "b107ec4d8aa1977f8eb6a388f5e6f7e438d84c08584d0cab38ca75e37d580f52",
         x86_64_linux: "a6ea0f6e81d3d38b99207765d85ed154d16ab450acff5a61ad5d5e8a9aeb2f48"

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
