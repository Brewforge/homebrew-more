cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.0.7"
  sha256 arm:          "c0d832a4330397d582554ec07dfcfbe8d8ccc985f8b8cdda31916ee88402bab8",
         x86_64:       "78652f00f0bf890aad67098001c53431b2410c335ef2e2f430d89c7712972a8d",
         arm64_linux:  "c769034c2c17b32e9189ebbb7e82f0a9fe0dac57c5aee3fc87f54ee57ce43718",
         x86_64_linux: "8861da621b67b446a4b4ab37fa713b26d452307e24cf2776933fb92b4db375e8"

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
