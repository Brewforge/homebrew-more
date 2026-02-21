cask "typdiff" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.1.0"
  sha256 arm:          "58b4f48d83a9922e50f3c67d9bdf8248343c2e8ff3711bb62be0345cc3930821",
         x86_64:       "8a7821e3b4018202f74e75543308a4d4f1be61dcdc0d2159c3b5afd44d3c3e31",
         arm64_linux:  "30a81748598842f1a91f90206c108c82df3099dd10e4e56dc7574a70c0d73daf",
         x86_64_linux: "e46cbb4b568177c5d61755622345939fe500983403d4d45e21059b813e724b88"

  url "https://github.com/sou1118/typdiff/releases/download/v#{version}/typdiff-#{arch}-#{os}.tar.gz"
  name "typdiff"
  desc "Diff tool for Typst documents"
  homepage "https://github.com/sou1118/typdiff"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "typdiff-#{arch}-#{os}/typdiff", target: "typdiff"
end
