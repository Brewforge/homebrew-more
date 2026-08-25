cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.6.0"
  sha256 arm:          "376981d14f96f792ec08cb6a5fa6dd92b4329e11413a0f45e606d83a4b09ccd0",
         x86_64:       "376981d14f96f792ec08cb6a5fa6dd92b4329e11413a0f45e606d83a4b09ccd0",
         arm64_linux:  "305f5e3009b2da835c94365467f15359173695ef6793d80a9cd9b9e594b67ea8",
         x86_64_linux: "305f5e3009b2da835c94365467f15359173695ef6793d80a9cd9b9e594b67ea8"

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
