cask "presto" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.1"
  sha256 arm:   "7e5e3a11010ed0f0e9651d002b445955869abe61f2468c4341925e41f7187597",
         intel: "b84a397b0ab9a6b69b99997d476d81a30f4a9b609b0e011a1b7314dd1e43a701"

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
