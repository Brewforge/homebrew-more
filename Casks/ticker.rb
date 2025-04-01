cask "ticker" do
  arch arm: "arm64", intel: "amd64"
  os macos: "mac", linux: "linux"

  version "4.8.1"
  sha256 arm:          "c4b4b0b0655e13797a36155c40a4457716e612af75c5cb1f91f877b7bfa3a26d",
         x86_64:       "7f57434aae33f0aeb60ca3d1c59af05056cdc03cfe7bb1fdfd50520bf02ae1fe",
         arm64_linux:  "74547627a38e170ad64df57413c1b2c29d73a59fa53df29080b02c39e02ba7eb",
         x86_64_linux: "a6f3d0adb5151f8c633e474e2629cffe9e11943cb89a21c8f55f4275a97419ec"

  url "https://github.com/achannarasappa/ticker/releases/download/v#{version}/ticker-#{version}-#{os}-#{arch}.tar.gz"
  name "ticker"
  desc "Terminal stock ticker with live updates and position tracking"
  homepage "https://github.com/achannarasappa/ticker"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "ticker"
end
