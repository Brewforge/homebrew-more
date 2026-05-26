cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.98"
  sha256 arm:          "1572f2a81f69c15590c60365c38bebde1236aaa619a68b370935c1c60d8d1a8c",
         x86_64:       "592d88653f333b58b5da439cdd90b8e2977175128bf44733b744628092da9f2c",
         arm64_linux:  "ddfd402c9ad9bbb7f692afc0dbd9e64edd56d3117ac8caa0c5b20e33ec92c509",
         x86_64_linux: "aa20503456a85f95c95a255c61860bce9d23c93b50dc51cc22b33c1028c385c2"

  url "https://github.com/iOfficeAI/OfficeCLI/releases/download/v#{version}/officecli-#{os}-#{arch}"
  name "office-cli"
  desc "Give any AI agent full control over Word, Excel, and PowerPoint"
  homepage "https://github.com/iOfficeAI/OfficeCLI"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "officecli-#{os}-#{arch}", target: "officecli"

  on_macos do
    preflight do
      system_command "xattr",
                     args: ["-r", "-d", "com.apple.quarantine", "#{staged_path}/officecli-mac-#{arch}"]
    end
  end
end
