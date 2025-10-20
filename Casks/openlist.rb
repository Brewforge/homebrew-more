cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.1.5"
  sha256 arm:          "3d0700c2705bf2ead0ca7702a4fff9e9e17b48f7b8dc478bd2df3907211e347d",
         x86_64:       "2b7712d8cfb35c6573d0149eae2b1140208b5c3ef499df46fa10ebba0ba867da",
         arm64_linux:  "066cd7dca81b0d03534464747ec2561a9d78d187377417012a1a6f00bfc1210d",
         x86_64_linux: "29059a28c463838a8c5f7a12689fb9f41604476181b1ac6119b3ffb6b426d0e4"

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

  caveats <<~EOS
    To reveal openlist admin user's info in default `config.json` again, run the following command:
      cd #{staged_path} && openlist admin
    Or reveal `admin` password via `sqlite3` command:
      sqlite3 etc/openlist/data.db "select password from x_users where username = 'admin'"
    Or reset `admin` password:
      cd #{staged_path} && openlist admin random
    Or set new `admin` password:
      cd #{staged_path} && openlist admin set NEW_PASSWORD
  EOS
end
