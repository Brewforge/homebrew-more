cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.0.0"
  sha256 arm:          "4a70b0d50c5b99ef8d59467582aa6a98eccee98be464100dc349226620c4591b",
         x86_64:       "15f1a537ec596801cfcd6170a58c67dfc5d9675bbe2edbeb8a9d30d6f96ef70a",
         arm64_linux:  "200c96e446ba34129732315b442921ed1a34ad741702816c927a4928d87d443f",
         x86_64_linux: "6bf5cab6bdbed4432f277665f1ea53e6ae648cc0d0a8865fd0f6a59d46857728"

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
