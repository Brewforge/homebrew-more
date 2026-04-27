cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.0"
  sha256 arm:   "5bfc70d73c75c41a6945dedced284141c7b1f92d679e710b13c3d28fbd462d0d",
         intel: "a019a8771fc7a5d36797229c78807af0dbb7197753b3b86178ecd490cc8a6837"

  url "https://github.com/Presto-io/Presto/releases/download/v#{version}/Presto-#{version}-macOS-#{arch}.dmg",
      verified: "github.com/Presto-io/Presto/"
  name "Presto"
  desc "Markdown to PDF document conversion tool powered by Typst"
  homepage "https://presto.mre.red/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Presto.app"

  preflight do
    system_command "xattr", args: ["-cr", "#{staged_path}/Presto.app"]
  end

  zap trash: []
end
