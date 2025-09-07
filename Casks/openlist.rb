cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.1.2"
  sha256 arm:          "d2da54d1fccc7a47639409dc1f5809601f7e74204a1787046e771b9a9f6099db",
         x86_64:       "5ac35aa2caf2c408c59077bee8bf86252568b6548768d53c0b8096e537ae7706",
         arm64_linux:  "8d37d28529b960aa8f6a6c271c3f098622b66a869a4bd2cb1c7999204271af25",
         x86_64_linux: "9e92e751ad920907cb7f950806d0b235ee9dd311820ad7048f5f1ab220de5905"

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
