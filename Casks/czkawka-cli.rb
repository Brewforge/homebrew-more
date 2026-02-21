cask "czkawka-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "mac", linux: "linux"

  version "11.0.1"
  sha256 arm:          "62895a4873c79516a7c07d3fbfdc7fda1f7ff806d589558e40f56c7e959828a3",
         x86_64:       "ed360781c1da7b5596ba05feeaf87ea18f46f2125b4fdb4feb4fbac6ddb5d418",
         arm64_linux:  "eb333e3b29d576db6d2365cd9deff454cfc9e7bc9b8b6dfefb4ab82b14db7dc8",
         x86_64_linux: "2f81d63f79047294629253f4232c47cf5a2c6e55b9e34f23d11c2c810cfcbc09"

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
