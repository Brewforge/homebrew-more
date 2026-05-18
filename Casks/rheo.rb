cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.3.0"
  sha256 arm:          "d942687fd031a9deb8173ddcce99d248f523032844bf38d6e8f86096ca4cb176",
         x86_64:       "d942687fd031a9deb8173ddcce99d248f523032844bf38d6e8f86096ca4cb176",
         arm64_linux:  "c32c8a71dc6dff283ab86e224623d8d5df17945c2117f9965fd355ae0b0e4cd7",
         x86_64_linux: "c32c8a71dc6dff283ab86e224623d8d5df17945c2117f9965fd355ae0b0e4cd7"

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
