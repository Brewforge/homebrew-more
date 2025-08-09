cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.1.0"
  sha256 arm:          "89421fb06ff5d36cdd04245b7f8f8ba896b30dd4a75f50a42f2a62ccedbd6170",
         x86_64:       "f360fd29f0ed00ad24b4668dfaee2258dc8efe5cd5b8d03b3418d865bd279fd1",
         arm64_linux:  "4dd95812afb043790c481a4897c09b3d16ddd6541749e3ec40bd42563a6535c7",
         x86_64_linux: "65802f4e2c03af241ac1e74ca75a61b6f7ff8cae27eeb6842a2c64ad6c7de106"

  url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-#{os}-#{arch}.tar.gz",
      verified: "github.com/OpenListTeam/OpenList/"
  name "openlist"
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://oplist.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "openlist"
  service do
    run [opt_bin/"openlist", "server"]
    working_dir bin
    keep_alive true
  end
end
