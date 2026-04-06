cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.2.0"
  sha256 arm:          "1a3eba53960a3879aad6b383cec6da21b767b9b5f3ccf50779be6a9581af69ff",
         x86_64:       "1a3eba53960a3879aad6b383cec6da21b767b9b5f3ccf50779be6a9581af69ff",
         arm64_linux:  "bc6568572b8568439e4e92175302a8b629cf16c6bb8b10de8785f3ecc5a5d75d",
         x86_64_linux: "bc6568572b8568439e4e92175302a8b629cf16c6bb8b10de8785f3ecc5a5d75d"

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
