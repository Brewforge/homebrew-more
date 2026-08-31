cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.6.2"
  sha256 arm:          "a2325fc3aa5e1ee1a6351c75c940dff411e74d5b30570fada41bae9f7e5193eb",
         x86_64:       "a2325fc3aa5e1ee1a6351c75c940dff411e74d5b30570fada41bae9f7e5193eb",
         arm64_linux:  "84f8500800cb938c1bba8173885e190444d19b4f4a028261a6a478b6e5ef747d",
         x86_64_linux: "84f8500800cb938c1bba8173885e190444d19b4f4a028261a6a478b6e5ef747d"

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
