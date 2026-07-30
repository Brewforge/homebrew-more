cask "krokiet" do
  arch arm: "arm64", intel: "arm64"
  os macos: "mac", linux: "linux"

  version "12.0.1"
  sha256 arm:          "77e7420ce04f6e6aa01f9c509f800d8921beb361128ccfcbe9def3aa401fbf9b",
         x86_64:       "77e7420ce04f6e6aa01f9c509f800d8921beb361128ccfcbe9def3aa401fbf9b",
         arm64_linux:  "170b252fb007a2a18d16b0162c8c118f192e111f959585bea4f683ceddb6d3df",
         x86_64_linux: "170b252fb007a2a18d16b0162c8c118f192e111f959585bea4f683ceddb6d3df"

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
