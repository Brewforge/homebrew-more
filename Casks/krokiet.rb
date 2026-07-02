cask "krokiet" do
  arch arm: "arm64", intel: "arm64"
  os macos: "mac", linux: "linux"

  version "12.0.0"
  sha256 arm:          "09adbb733bdfb7444c4d1c3cb6ea5c1663f3ac63def9f639e74bf4eccb87fbaa",
         x86_64:       "09adbb733bdfb7444c4d1c3cb6ea5c1663f3ac63def9f639e74bf4eccb87fbaa",
         arm64_linux:  "d0de7c036c7a642d54fc19f294c027913b77161a58f1c3ca1ad995b11377ea4c",
         x86_64_linux: "d0de7c036c7a642d54fc19f294c027913b77161a58f1c3ca1ad995b11377ea4c"

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
