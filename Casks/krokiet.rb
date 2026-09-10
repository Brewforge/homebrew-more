cask "krokiet" do
  arch arm: "arm64", intel: "arm64"
  os macos: "mac", linux: "linux"

  version "12.0.2"
  sha256 arm:          "e143fbdc50a2ce5719db5e6311bf6f21728ad13a7bbd065e4f0f83c14573f436",
         x86_64:       "e143fbdc50a2ce5719db5e6311bf6f21728ad13a7bbd065e4f0f83c14573f436",
         arm64_linux:  "f45b7fb03d708f29392115b970a05413dd5f518f9778984ff2a0bec8ccac73b3",
         x86_64_linux: "f45b7fb03d708f29392115b970a05413dd5f518f9778984ff2a0bec8ccac73b3"

  url "https://github.com/qarmin/czkawka/releases/download/#{version}/#{os}_krokiet_#{arch}"
  name "Krokiet"
  desc "Czkawka GUI based on Slint"
  homepage "https://github.com/qarmin/czkawka"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "brewforge/more/czkawka-cli"

  binary "#{os}_krokiet_#{arch}", target: "krokiet"

  zap trash: "~/Library/Application Support/pl.Qarmin.Krokiet"
end
