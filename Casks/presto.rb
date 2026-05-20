cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.1"
  sha256 arm:   "88188d7cc6e5ffc0ebdc70cd5b2ab1b4c825bfc5db16b828353e2004b4fcdeb6",
         intel: "5f400644d5663c7bce58481fc5120effed13b244c0d9122f343affe90d512a76"

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
