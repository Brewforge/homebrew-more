cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.1.6"
  sha256 arm:          "ba6fb1dd7900bfe00f4b18c632402dbaa8706c96f92bd8277b1f678def808a11",
         x86_64:       "4e6c1a4ca0690e0483c35efe55fea0384f9969197c9c2b560dad6b898eab8c41",
         arm64_linux:  "1ecfdd1f2fc5ac3284dd02afc6f660c5cbf8374aeba7cad91a7e2d77863cbbcb",
         x86_64_linux: "52749ce0926aeb5ab71a0fd39f7856d393378a485575a13e6f64eb602f2d811b"

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
