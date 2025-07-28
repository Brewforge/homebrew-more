cask "openlist" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "4.0.9"
  sha256 arm:          "ecc3b28bf9f90a5fe7aae789814e477b31436b64962cfc6a40cef858fe759a83",
         x86_64:       "591bcf502fb1135ed5f3339e1d3d6cd15fab3725648ab609805cf988d8e9137f",
         arm64_linux:  "cde99dc04e7e958cf57914cd0f2d96145910eea7edea8809aad017fa5c93587c",
         x86_64_linux: "9e34354f883d16fbf9b27c2155578c2fae067581ec1e3d3868cd7a2aaa2c4f3f"

  url "https://github.com/OpenListTeam/OpenList/releases/download/v#{version}/openlist-#{os}-#{arch}.tar.gz",
      verified: "github.com/OpenListTeam/OpenList/"
  name "openlist"
  desc "File list program that supports multiple storage, powered by Gin and Solidjs"
  homepage "https://oplist.org/"

  livecheck do
    url "https://github.com/OpenListTeam/OpenList"
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
    Or reveal `admin` password via `sqlite3` command (before v3.25.1):
      sqlite3 etc/openlist/data.db "select password from x_users where username = 'admin'"
    Or reset `admin` password:
      cd #{staged_path} && openlist admin random
    Or set new `admin` password:
      cd #{staged_path} && openlist admin set NEW_PASSWORD
  EOS
end
