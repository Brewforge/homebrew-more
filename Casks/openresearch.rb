cask "openresearch" do
  version "0.2.30"
  sha256 "f9f30d75f60055784993fdac8b1893801d509524f35ef168c4b765c183cb4f6e"

  url "https://github.com/alphaXiv/OpenResearch/releases/download/v#{version}/OpenResearch.dmg"
  name "OpenResearch"
  desc "Local-first harness and workspace for research agents"
  homepage "https://openresearch.sh/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "OpenResearch.app"

  uninstall quit: "org.alphaxiv.openresearch"

  zap trash: [
    "~/.cache/openresearch",
    "~/.config/openresearch",
    "~/.local/share/openresearch",
  ]
end
