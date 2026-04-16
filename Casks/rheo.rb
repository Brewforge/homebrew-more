cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.2.1"
  sha256 arm:          "0d3c9bf27241deb6a91f736bdf6426bcf02a11c38261b15cfaf943121ba79fe3",
         x86_64:       "0d3c9bf27241deb6a91f736bdf6426bcf02a11c38261b15cfaf943121ba79fe3",
         arm64_linux:  "6b094439c86cf7b3848565e5163531e5705ea574511967bffbe50253e5582ad7",
         x86_64_linux: "6b094439c86cf7b3848565e5163531e5705ea574511967bffbe50253e5582ad7"

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
