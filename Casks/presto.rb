cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.2"
  sha256 arm:   "16a750957d5c2e85cc0347ab7a368a63e7ebd64d78770ebdc8e313b68d30d735",
         intel: "a366e0236275e459da20c3b3c81c82bc44f9703d91eee40148589e8758070bf9"

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
