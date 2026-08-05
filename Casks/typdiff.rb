cask "typdiff" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.1.2"
  sha256 arm:          "144895fa57a76c5b0286f229afb9a72ba1d0cade8113064d8a8ab07a88933c2e",
         x86_64:       "9fe5ea358b2254a24bdebf6adb7889edf73ec25ce9de8ac88083c4cc349ecba5",
         arm64_linux:  "d178089c1b8fc630897cd27e3b66ff045c9e740971680d9f7580784fd5cc1ad7",
         x86_64_linux: "b1ac17dc3ef38fd20cb2997bd757561788624da18eae69c0220244970ab67ee1"

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
