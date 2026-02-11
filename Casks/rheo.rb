cask "rheo" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.1.1"
  sha256 arm:          "a5db73c1d9e955db259ba0a8c528cd174f10f75ed939e2d9b5f7c2a8cac40fd6",
         x86_64:       "a5db73c1d9e955db259ba0a8c528cd174f10f75ed939e2d9b5f7c2a8cac40fd6",
         arm64_linux:  "ae52aed9192ab9dd18b3f578d9654efac4676f045b8e0fcf7baf20fc4d35ff04",
         x86_64_linux: "ae52aed9192ab9dd18b3f578d9654efac4676f045b8e0fcf7baf20fc4d35ff04"

  url "https://github.com/freecomputinglab/rheo/releases/download/v0.1.1/rheo-0.1.1-#{arch}-#{os}.tar.gz",
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
