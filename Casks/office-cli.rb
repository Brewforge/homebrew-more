cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.72"
  sha256 arm:          "19a457cb95e88aaf991deaebc56eb4591b317ece3e5e0bde295b2c54f56e47c0",
         x86_64:       "641a44f39b5fed4cddc25165e798415c9b08107a1cd938e6288032e7f20161ca",
         arm64_linux:  "4a5ea9cd6d64915ac2dd277ed797a15e40e8ea2375176b8e94a455080e27506d",
         x86_64_linux: "05dfbf8912e5fe229067e24604b7b8e390840895e3cab8f6450faf41369aed2e"

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
