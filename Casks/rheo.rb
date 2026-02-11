cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.1.2"
  sha256 arm:          "adbe16810c67ee9c5349005b6b9455c22fda04583875399ca6ea5720c583dbb9",
         x86_64:       "adbe16810c67ee9c5349005b6b9455c22fda04583875399ca6ea5720c583dbb9",
         arm64_linux:  "f6b465b47a5e192380a802b38ae4a27b906e54b248744a5b71eb2c58e298ff56",
         x86_64_linux: "f6b465b47a5e192380a802b38ae4a27b906e54b248744a5b71eb2c58e298ff56"

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
