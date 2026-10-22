cask "typdiff" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.1.4"
  sha256 arm:          "b33377e9be1faf517ab42b1c4f6822499d401b3721e04cd087a11251edb8691f",
         x86_64:       "c8f4fa1627a0f8172d76dd9c74d848805dadc4fc11568efae865fedbe95b854d",
         arm64_linux:  "5051d598e9e7a8350a6de415251176af9ff24005119acfc29444a214226bb15a",
         x86_64_linux: "470caee91742ba2ec8528f8e8eb5ac591f0d832aa3404c185ffe47436530e576"

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
