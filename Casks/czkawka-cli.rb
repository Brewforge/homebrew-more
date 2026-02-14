cask "czkawka-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "mac", linux: "linux"

  version "11.0.0"
  sha256 arm:          "5bf7f7c197a11212df9a944352d383e3c95d8ece0f2c0d52b59d2e9384164b53",
         x86_64:       "78961f525d0325b113a00c7f5951ef06b36dcbd8093736b0bd904278a0a1df3d",
         arm64_linux:  "2235fbf294595558db9f3f4854ca7c9ea045a66710e11a16f8dc9e4c188ddc90",
         x86_64_linux: "199a3cfa9f9d6fb9ceaa1efc13e7fefd32528f2c87f2c1c541a065259c1df354"

  url "https://github.com/qarmin/czkawka/releases/download/#{version}/#{os}_czkawka_cli_#{arch}"
  name "czkawka"
  desc "Duplicate file utility"
  homepage "https://github.com/qarmin/czkawka"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "brewforge/more/czkawka-gui"

  binary "#{os}_czkawka_cli_#{arch}", target: "czkawka"

  zap trash: "~/Library/Caches/pl.Qarmin.Czkawka"
end
