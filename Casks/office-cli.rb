cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.92"
  sha256 arm:          "7e4f3e083d1ec4fab0a6478f5e7778f01353f501bc58564492acc3f11313ff65",
         x86_64:       "6ac95f8cc13590daa57857e221bece9c04e840bf298e754c430c914afc61fff3",
         arm64_linux:  "95fcbf96687aed67c9a7c6a4daaf7daa8d7f8298d5d4b9260f34fe6dd30a3b61",
         x86_64_linux: "deca2a87583bf8a25096cab9be6e626a48b787cf59875311b30c39a394970ffa"

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
