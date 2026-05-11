cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.87"
  sha256 arm:          "6a790448f0752f300c535cae11e19cbe692db6297fe267c7a60bcdc0f1feb32a",
         x86_64:       "daf8331c62ac151e505b7013454385e7f4aa72d3a879f6f93802cef034ab8880",
         arm64_linux:  "46a27aa245ed8678aa254684aabde59dde0e90110b558589274f229a3dbb859c",
         x86_64_linux: "29685c516f212d0eaf92aca6cc479c225669776103ad76a4abacc8911b195389"

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
