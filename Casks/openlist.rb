cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.0.8"
  sha256 arm:          "20bc46929941f6a098ba1dc677864d5c20bde9a05f71669840fd21c51a8298a7",
         x86_64:       "6b6bb7389887d5d7d0123d4dda1bce9d973a6dfd0de4ab4ddd3e5e5e0aa56695",
         arm64_linux:  "e80dd23aec93f38bb424e12f8d29ee492fa85faa8b12157523111d71c6a29677",
         x86_64_linux: "0969dfbb1277b730086d965a33948ec949d6549468e16b25c2bb9c8e484ba74b"

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
