cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.70"
  sha256 arm:          "fc62bd102c0bbbf519880c022e1993886f03b27022c029b4223113446f1039b7",
         x86_64:       "a3134d5e448f82d55fc42666fbc31b0237c72f46adfade2ad86cd6bb59de3951",
         arm64_linux:  "4a4a8d7c1149a9480e2d5057ef04e55f49bc67206f123886dee5ca12c20e0f8e",
         x86_64_linux: "654a4a9e651ce992f8352a3c6700feb5210a9cc64baaf093e773e69e858f54a9"

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
