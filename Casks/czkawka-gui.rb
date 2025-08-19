cask "czkawka-gui" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "mac", linux: "linux"

  version "10.0.0"
  sha256 arm:          "f095078ad8f906633447abb102c300e50337d7e53de386dfe2e26c25233e9cc2",
         x86_64:       "e1070ef052f20c9144e8c2a2dcfb6a578549918eab78d5162497c1e8106d7d70",
         arm64_linux:  "512f4d9a385da6e7755ccd86853021e72a7352bebd812174554f545423663b87",
         x86_64_linux: "99c8d36f56a49c27b3a98a450210a59d36e64b6cfff7a48a2b440199b66f1a76"

  url "https://github.com/qarmin/czkawka/releases/download/#{version}/#{os}_czkawka_gui_#{arch}"
  name "czkawka"
  desc "Duplicate file utility"
  homepage "https://github.com/qarmin/czkawka"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "brewforge/more/czkawka-cli"
  depends_on formula: "gtk4"

  binary "#{os}_czkawka_gui#{arch}", target: "czkawka"
end
