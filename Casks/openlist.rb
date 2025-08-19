cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.1.1"
  sha256 arm:          "edaacd65e072161599416e563832b1fb05fd1e4e4bb34bb9c836a3fc5617bae2",
         x86_64:       "4c8e0d36e556109ea698f2fe6583eadca51d689f395ed2a299300971e24b4567",
         arm64_linux:  "396293be85a193ede40429701ba37812c3d5b8438a82cc4ae7eb7d27e972055d",
         x86_64_linux: "21133416b48e0f621e4a4a168b789bb711b0648d389bdf8caa8ed5375ad79a24"

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
