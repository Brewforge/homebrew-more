cask "gotmail" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.1.1"
  sha256 arm:          "d4c1cf074b12f0042afe95a57ec80de87e87f2cf71e15bbced66cf8f096ee86d",
         x86_64:       "d0f061e5f5aa7687fc7f0ffba16c778a3f62e3961b6acc8c483f9f412895b2d2",
         arm64_linux:  "72cc28db8751d794811681075b061145a6e5a5ea6df70fa2e60245354be704fb",
         x86_64_linux: "acf8a3ba4610a8ebcb6eae077710cfee7149cd899696ba3def05a6442f519394"

  url "https://github.com/ivaquero/gotmail/releases/download/v#{version}/gotmail_#{version}_#{os}_#{arch}.tar.gz"
  name "gotmail"
  desc "Terminal stock gotmail with live updates and position tracking"
  homepage "https://github.com/ivaquero/gotmail"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "gotmail"
end
