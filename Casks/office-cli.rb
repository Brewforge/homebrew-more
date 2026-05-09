cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.78"
  sha256 arm:          "fef3201b71b6136b142a9aee74cf9b6468f432a8af4f3e3dc68d659871d0ae68",
         x86_64:       "b5adb7931a7900af497dbe8cf2a4fea43fd46a67c3c033f8713380a01e63d31c",
         arm64_linux:  "d843160fe424c9e2e271d8234d6885b21f52cc30591f661e8dd5023874827b10",
         x86_64_linux: "25d93b79b5fd92b6c01e5a6fcfbf398f1cee0553c628e05f4d094e42fcd3cb61"

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
