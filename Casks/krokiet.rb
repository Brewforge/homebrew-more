cask "krokiet" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "mac", linux: "linux"

  version "11.0.1"
  sha256 arm:          "04bc51fa769e8373ef6c2425c08cd7016b2cc826ec29e25d3a403bc8a56e8a70",
         x86_64:       "bbbdf421681a7c7339c19c8bf625c0d676d4160ecc998eae4c9ca8356405219d",
         arm64_linux:  "523d3f3b600eac8d7d087f505db52f849b9546445a82c82f250561349fb9c274",
         x86_64_linux: "1d33483a11d166af7e98ae2e6c2c7d34f84b3f813a7a68f2bab02dc807bbca9c"

  url "https://github.com/qarmin/czkawka/releases/download/#{version}/#{os}_krokiet_#{arch}"
  name "Krokiet"
  desc "Czkawka GUI based on Slint"
  homepage "https://github.com/qarmin/czkawka"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "brewforge/more/czkawka-cli"

  binary "#{os}_krokiet_#{arch}", target: "krokiet"

  zap trash: "~/Library/Application Support/pl.Qarmin.Krokiet"
end
