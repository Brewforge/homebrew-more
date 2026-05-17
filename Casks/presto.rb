cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.0"
  sha256 arm:   "57aceee3f628b640f6a5d192d88b77a810d9641f6086e0257268faafc4fcc8b5",
         intel: "999fb132ee66b4bb048441d7d49519965368cf3862cfaa299f5112610ac113eb"

  url "https://github.com/Presto-io/Presto/releases/download/v#{version}/Presto-#{version}-macOS-#{arch}.dmg",
      verified: "github.com/Presto-io/Presto/"
  name "Presto"
  desc "Markdown to PDF document conversion tool powered by Typst"
  homepage "https://presto.mre.red/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Presto.app"

  preflight do
    system_command "xattr", args: ["-cr", "#{staged_path}/Presto.app"]
  end

  zap trash: []
end
