cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.5.2"
  sha256 arm:          "6f9a6ec0f8989dc640dd09170a112c281958b1cdcf78e0c97e9c98cdf48f2364",
         x86_64:       "6f9a6ec0f8989dc640dd09170a112c281958b1cdcf78e0c97e9c98cdf48f2364",
         arm64_linux:  "53938194e9cb7e3645d06ce1540a1d9f83017e8b18366220fe30d2749c89abd4",
         x86_64_linux: "53938194e9cb7e3645d06ce1540a1d9f83017e8b18366220fe30d2749c89abd4"

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
