cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.6.4"
  sha256 arm:          "e13eb4fb33cd88376d071e3a288da1caa4e9e659d9328a69a845d5beab94f995",
         x86_64:       "e13eb4fb33cd88376d071e3a288da1caa4e9e659d9328a69a845d5beab94f995",
         arm64_linux:  "000403ca68439b1aa8351a9a06ed95d9e43f4572071020712b45dc97ea1bf723",
         x86_64_linux: "000403ca68439b1aa8351a9a06ed95d9e43f4572071020712b45dc97ea1bf723"

  url "https://github.com/freecomputinglab/rheo/releases/download/v#{version}/rheo-#{arch}-#{os}.zip"
  name "rheo"
  desc "Typesetting and static site engine based on Typst"
  homepage "https://rheo.ohrg.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "rheo-#{arch}-#{os}/rheo", target: "rheo"
end
