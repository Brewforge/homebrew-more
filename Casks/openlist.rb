cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.1.4"
  sha256 arm:          "8869da30a26f40b302b220183d087bcd2b4d21b0357d39f087dc8bc7e0a9fbc2",
         x86_64:       "021f191fd8fb9219ba15b44d4dd7bef846ac9d4a1fc30be416bdca6306674c9a",
         arm64_linux:  "4a917bb4d2f1edf850919c0dd845d8d6aa9b119d1e30871e27c3d12ae1143221",
         x86_64_linux: "c8abb3d8a4eed1a3624e17ff86fb9e580f328b59732cc6ad1f6b129bf00580f4"

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
