cask "czkawka-cli" do
  arch arm: "_arm", intel: ""
  os macos: "mac", linux: "linux"

  version "8.0.0"
  sha256 arm:          "4df84014d818bd6dff2b365b847645340e8955c4450fe965688f41af89a38baa",
         x86_64:       "262c15ca7890898560d00e5ffd5ada1864fbd9d0d58ac4ee492c9f3e73f3ae5f",
         arm64_linux:  "5bb1ab8987a33be08ad07367d2e70ea4f18868ba4538a77019aba48e76ed7892",
         x86_64_linux: "ec233b7d8d40b1cc4447dac05be343f53a757dc605743a8808abaa8e97e5d10e"

  url "https://github.com/qarmin/czkawka/releases/download/#{version}/#{os}_czkawka_cli#{arch}"
  name "czkawka_cli"
  desc "Duplicate file utility"
  homepage "https://github.com/qarmin/czkawka"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "czkawka_cli"
end
