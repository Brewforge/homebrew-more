cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.1.3"
  sha256 arm:          "9384d98e07422956140c0ba219c96978e9fd651701f05d04d9d8f8799c34f247",
         x86_64:       "f2d5b9bf7984624f77e68185bab0cd1921be78ca7c68fb272702cfa0f78d6859",
         arm64_linux:  "456cd5ae985495ab3d2d78650328d1cbce1d0ffc6b45eed356b9f1f266f0f03f",
         x86_64_linux: "84e19f5cda1a61ae020bd0905834a8ffb5168223c6fb753a6d28b610d45d6817"

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
