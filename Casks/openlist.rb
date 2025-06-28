cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.0.4"
  sha256 arm:          "f8be337ebc9070124a11d5538b4d196a0eb1b028cc9c96626309582263a3305f",
         x86_64:       "c7446e7e89f0e0aef6865e78e7e2f02afa5a7f0e9a1f9bf6468be817e370246f",
         arm64_linux:  "19c929dd70ab8a0d5dca683eafda9299401e3df6ea5d5e42c1d3b387df9597c3",
         x86_64_linux: "1c68bb38cc0531b05a1b1749baeb1eb099842dce768091c3943ba48a0a5c3dd4"

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
