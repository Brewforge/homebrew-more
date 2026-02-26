cask "typdiff" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.1.1"
  sha256 arm:          "db3093dce946c4d5c632c425a9a3db5ba025c3d1ff83f0619a07034e3a429deb",
         x86_64:       "18365c9dd25c203f5454f0a0060f60ffea6b13d256fbd307c07e1921b52c927d",
         arm64_linux:  "664376d35fde8532ed327571ba10b1056891b39b652877d7349410339b5d17c6",
         x86_64_linux: "8b63979e8c08f96d39c69f01a59993852da003cd1471a9811a1257c0724c0fe5"

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
