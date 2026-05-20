cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.95"
  sha256 arm:          "d788499b65306fe74af2932b80e5b0d827c9218545fe5c32bede71ad2d244409",
         x86_64:       "a642dd0d46c31943f72734fdde74b4fb6c5347f52f5282d58eb8abdc524b175f",
         arm64_linux:  "b3c8f3309c5792a4818ed8d2d23cdb761a0aca49006356d300fec8589d66c799",
         x86_64_linux: "5dbad4c6ef9b7429b161c68732474678f5f3587ac7f85bb27d5c40eb34ec4890"

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
