cask "gotmail" do
  arch arm: "arm64", intel: "amd64"
  os macos: "darwin", linux: "linux"

  version "0.3.2"
  sha256 arm:          "34ef8487c57c2a251acba5a844af1c5348664d35bca0a856ba32ac1e0ca6e69b",
         x86_64:       "3e6162790f396c601f1028465c088e1e6cdfe0ea259727bcdbedbc9620b57464",
         arm64_linux:  "eaa308a3e35141e48df08b260d02b4a447e54a53e8a5d5d87b95708eec50fd4b",
         x86_64_linux: "655e7a78476f58040282cef45bda5f7bdf6469140241a4e5d0c1abb9ea45b9c4"

  url "https://github.com/ivaquero/gotmail/releases/download/v#{version}/gotmail_#{version}_#{os}_#{arch}.tar.gz"
  name "gotmail"
  desc "Terminal stock gotmail with live updates and position tracking"
  homepage "https://github.com/ivaquero/gotmail"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "gotmail"
end
