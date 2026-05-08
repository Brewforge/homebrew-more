cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.76"
  sha256 arm:          "a962c68cac3b7ad3f2e301e91afbad58d01ce52637f7356fa71e2a0727369eab",
         x86_64:       "37d606930a7546ebb25bfd6ada735c6b0978ff0d64f0fe66627279c59279d234",
         arm64_linux:  "133a57a5295144a1b5c80b061b5bf46b4fa6f738f11c39f86139cf4380d3545d",
         x86_64_linux: "c8d70921c6e41b1e2000ba68688870e4b6af92885675c64dc6c386ff313fe984"

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
