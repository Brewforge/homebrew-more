cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.0.1"
  sha256 arm:          "60bb6a12b141d8a051714e1ba0d329ddedfacc269bd1d8df29c8722767095243",
         x86_64:       "cf32723e18897c7e50a90239cdb6c3422f37b5ef86caf78302635a2edfb8f784",
         arm64_linux:  "0c899a86b7e87e147d1f71a687d461c2b0856a407cf8a11c2da01d780e516df4",
         x86_64_linux: "f4d56103c43a99e01c97a28c534de9e5973e47065d4c748c0c7de80bbf37767d"

  url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-#{os}-#{arch}.tar.gz",
      verified: "github.com/OpenListTeam/OpenList/"
  name "openlist"
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://oplist.org/"

  livecheck do
    url "https://github.com/OpenListTeam/OpenList"
    strategy :github_latest
  end

  binary "openlist"
  service do
    run [opt_bin/"openlist", "server"]
    working_dir bin
    keep_alive true
  end

  def caveats
    <<~EOS
      To reveal openlist admin user's info in default `config.json` again, run the following command:
        cd #{staged_path} && openlist admin
      Or reveal `admin` password via `sqlite3` command (before v3.25.1):
        sqlite3 etc/openlist/data.db "select password from x_users where username = 'admin'"
      Or reset `admin` password:
        cd #{staged_path} && openlist admin random
      Or set new `admin` password:
        cd #{staged_path} && openlist admin set NEW_PASSWORD
    EOS
  end
end
