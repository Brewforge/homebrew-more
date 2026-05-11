cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.0"
  sha256 arm:   "24be498de9cbc8bdac0dcad51b1bc8ec1138c04aff28ff3790d9ff56ce7cdd8f",
         intel: "bb3ba9e91198c472537a7144d4bcc5525caaab0014bc9b1e311b5c4781704848"

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
