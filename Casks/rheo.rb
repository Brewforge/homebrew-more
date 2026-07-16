cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.5.0"
  sha256 arm:          "04e64b76120c6019fda727334c8fbf0bf1bc258d3834f413ca0b059c1a90db97",
         x86_64:       "04e64b76120c6019fda727334c8fbf0bf1bc258d3834f413ca0b059c1a90db97",
         arm64_linux:  "338382e5b0d416b7cb9364278472c495066b5c19613cd5fa22bae49f566c5a97",
         x86_64_linux: "338382e5b0d416b7cb9364278472c495066b5c19613cd5fa22bae49f566c5a97"

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
