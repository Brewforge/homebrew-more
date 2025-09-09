cask "ticker" do
  arch arm: "arm64", intel: "amd64"
  os macos: "mac", linux: "linux"

  version "5.0.6"
  sha256 arm:          "b72dba0f30e5b2eb8543ee1a41d2938993b86da8939d7facc9dbff1d2cb9e26c",
         x86_64:       "5f2b680d0a95f98de89893bf533905e361f8970015ddd328870b82bb02e132ba",
         arm64_linux:  "6f932c9a5c40b831a2b15794489e50c434fd91f81596cfc82b007a06fe44f13d",
         x86_64_linux: "48c8ba4d8f08460f6249d4f949fdd39c2059defc7d66a65d2193402d1414b6f7"

  url "https://github.com/achannarasappa/ticker/releases/download/v#{version}/ticker-#{version}-#{os}-#{arch}.tar.gz"
  name "ticker"
  desc "Terminal stock ticker with live updates and position tracking"
  homepage "https://github.com/achannarasappa/ticker"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "ticker"
end
