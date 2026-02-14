cask "krokiet" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "mac", linux: "linux"

  version "11.0.0"
  sha256 arm:          "591d00180a021a678c1fcbc9b8539e25a921c72aa2da6546010df64ee1214d08",
         x86_64:       "cbe63d52f40597d3166cb07aa4541694e23aaf76cda8acdb0660e084ff8bbe9c",
         arm64_linux:  "fc99754d9a008d4d5e316e9db99f7367fc64bebad68cb3c815a658b047b19076",
         x86_64_linux: "9c7c2f4a75c916b7947c9e0d9d4a3bd4d45cdec4648007bb3a9d7499d39a3c8d"

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
