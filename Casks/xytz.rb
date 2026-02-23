cask "xytz" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.8.5"
  sha256 arm:          "57c71ae84d873c1b210dfbe4955ac66576bbebcd674c37b5aa6bf4796e1b9d1d",
         x86_64:       "9e913b7e61a3d2618c8ca0eb60cf7a004a3af1c1fb58c8673d529d037e4c2c59",
         arm64_linux:  "6bc505ccd8a2aaac063e10a0b1360ce078b75b7381b4719ab3043b439c212a36",
         x86_64_linux: "138dc848f9dbbaaa74b62e01e96faf98b2970f4d58910b12e1010a3ec9723b5d"

  url "https://github.com/xdagiz/xytz/releases/download/v#{version}/xytz-v#{version}-#{os}-#{arch}.tar.gz"
  name "xytz"
  desc "Beautiful TUI YouTube Downloader app"
  homepage "https://github.com/xdagiz/xytz"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "xytz"
end
