cask "typdiff" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.1.3"
  sha256 arm:          "1fb5f0db186ae7bc38396d5f9c8ad735c93f1c127009aa6623ed2c23852fab2f",
         x86_64:       "c93cbde6ae7e552ca5b1c299978ee464dc53499768a6633b03d84e56b04a4ce8",
         arm64_linux:  "0c4fb761c11bdc88190ca45c1f9b3b274c67a63d8d38c5b46f9e0f65492a46f1",
         x86_64_linux: "040674365bdfe060e1992588499db20cdcd9b2cfff17408dbcf2428461ee3eeb"

  url "https://github.com/sou1118/typdiff/releases/download/v#{version}/typdiff-#{arch}-#{os}.tar.gz"
  name "typdiff"
  desc "Diff tool for Typst documents"
  homepage "https://github.com/sou1118/typdiff"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "typdiff-#{arch}-#{os}/typdiff", target: "typdiff"
end
