cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.4"
  sha256 arm:   "c0a1cc6798b9f29af3d7e8246d69b35bb8390f84d39ccf4669fc2118ed1196b5",
         intel: "fbd27b675d914ed669ea20afc55ecf69160020985973dd3f3a2bc95836f6840a"

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
