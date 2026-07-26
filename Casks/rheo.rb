cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.5.1"
  sha256 arm:          "21fe0fb13d2e0de27622f1ffe906147b85e3afa876669f196a2663c1c467b88c",
         x86_64:       "21fe0fb13d2e0de27622f1ffe906147b85e3afa876669f196a2663c1c467b88c",
         arm64_linux:  "55a568e6b387a5dcea2df1a91d9c5586ac69cbc51ce4d70fc61e4e0e24c115ae",
         x86_64_linux: "55a568e6b387a5dcea2df1a91d9c5586ac69cbc51ce4d70fc61e4e0e24c115ae"

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
