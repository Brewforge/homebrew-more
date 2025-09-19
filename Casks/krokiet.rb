cask "krokiet" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "mac", linux: "linux"

  version "10.0.0"
  sha256 arm:          "47e436b7e8d13bd8b6731225eb9c732a32d6f7f166c7a27735265a03dd4080ee",
         x86_64:       "5f03bb953974106d1d6028d54d0ad0ed25abacdce7698c6011846720817bc4c8",
         arm64_linux:  "cd032daf0a9b240294eb505cb83439c539039ece6fc54fe59fd8360c31c5f074",
         x86_64_linux: "2a368851a73df35994618e9fbf649f51600456be99e9988f0fb7de200b820c11"

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
