cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.0.3"
  sha256 arm:          "ee59e28b8eb76e5a25fbf5030a13d9ce9535ea67e8c8ff651196600600ceace1",
         x86_64:       "781bec0fbe39a3b49253a0cf205031a2e83c35e267f928a5ad5f7ad104318ee3",
         arm64_linux:  "c74234149eaa096661f83514b570141854d973d995334570f1c3c498608c7acf",
         x86_64_linux: "de41dfae699ff4354491bfb06403110ac0ab9a60f5ddf48b1ce388444509d447"

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
