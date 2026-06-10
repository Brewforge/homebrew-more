cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.3.1"
  sha256 arm:          "f9397858f5f5a7bd86f2c8226051f450ac04a0903f3cfd8b11d46f42385f5dee",
         x86_64:       "f9397858f5f5a7bd86f2c8226051f450ac04a0903f3cfd8b11d46f42385f5dee",
         arm64_linux:  "edb44e6d4e244f1170defa4a8cd5f00d47dd6a31518e916f15381806b12ad402",
         x86_64_linux: "edb44e6d4e244f1170defa4a8cd5f00d47dd6a31518e916f15381806b12ad402"

  url "https://github.com/freecomputinglab/rheo/releases/download/v#{version}/rheo-#{arch}-#{os}.zip",
      verified: "github.com/freecomputinglab/rheo/"
  name "rheo"
  desc "Typesetting and static site engine based on Typst"
  homepage "https://rheo.ohrg.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "rheo-#{arch}-#{os}/rheo", target: "rheo"
end
