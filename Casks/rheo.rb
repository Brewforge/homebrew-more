cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.6.3"
  sha256 arm:          "02fdf2aa3f0f98485281dd4b7ae443de62a8521b57b4f1780f7f5158b2d6fcdd",
         x86_64:       "02fdf2aa3f0f98485281dd4b7ae443de62a8521b57b4f1780f7f5158b2d6fcdd",
         arm64_linux:  "7cfec6158b64ce5025851bd0d5248e7ad3a86b06ffe48f0bb155beea358819f6",
         x86_64_linux: "7cfec6158b64ce5025851bd0d5248e7ad3a86b06ffe48f0bb155beea358819f6"

  url "https://github.com/freecomputinglab/rheo/releases/download/v#{version}/rheo-#{arch}-#{os}.zip"
  name "rheo"
  desc "Typesetting and static site engine based on Typst"
  homepage "https://rheo.ohrg.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "rheo-#{arch}-#{os}/rheo", target: "rheo"
end
