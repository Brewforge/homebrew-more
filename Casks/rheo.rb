cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.4.0"
  sha256 arm:          "de83c0f0ce1014539e72f1124a821e977eaaac0bf5fcaaf4ece5766781324f66",
         x86_64:       "de83c0f0ce1014539e72f1124a821e977eaaac0bf5fcaaf4ece5766781324f66",
         arm64_linux:  "4af7ab04da2c8d31612e6fbffb280c08fcd4ff285cb845a2a06bc05f5795cda1",
         x86_64_linux: "4af7ab04da2c8d31612e6fbffb280c08fcd4ff285cb845a2a06bc05f5795cda1"

  url "https://github.com/freecomputinglab/rheo/releases/download/v#{version}/rheo-#{arch}-#{os}.zip",
      verified: "github.com/freecomputinglab/rheo/"
  name "rheo"
  desc "Typesetting and static site engine based on Typst"
  homepage "https://rheo.ohrg.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "rheo-#{arch}-#{os}/rheo", target: "rheo"
end
