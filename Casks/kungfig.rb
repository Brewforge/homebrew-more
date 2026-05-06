cask "kungfig" do
  arch arm: "arm64", intel: "amd64"
  os macos: "apple-darwin", linux: "linux"

  version "0.0.1"
  sha256 arm:          "fef0bce02097e932e91d1f9c84e7f502159d6441b2115c1fd77733290ec7a239",
         x86_64:       "196a1e614545d5b4cbd5f916462edd7d517a2d02bca7648153071d43e5ad787e",
         arm64_linux:  "a30df15737b088c27a3cbdced87e6bde179b8964ddde9beef60f1bb88bcf071a",
         x86_64_linux: "b6b18674ab5e7a22e18c75afc3e95ff5eb522cb86e10b6443bb4fecc215c42b7"

  url "https://github.com/ivaquero/kungfig/releases/download/v0.0.1/kungfig-#{arch}-#{os}.tar.gz"
  name "kungfig"
  desc "Cross-platform configuration manager"
  homepage "https://github.com/ivaquero/kungfig"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "kungfig-#{arch}-#{os}/kungfig", target: "kungfig"
end
