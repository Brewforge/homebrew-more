cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.0.2"
  sha256 arm:          "7978d4ad8f4591214a5ffd320277f5bbefe2cbeb5dd147612079741974214ee5",
         x86_64:       "dc8ec9e084cac4372f29034d980be7735d54c5285d44d5ab5dd4f97725532270",
         arm64_linux:  "b33778fd0e228f33664d942477a1881c8f77521785c09353100f2f5df87b5229",
         x86_64_linux: "23d2dcfad02597a525cbc8be4c9a6955497e8647c5259e0b05a516983ffa5810"

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
