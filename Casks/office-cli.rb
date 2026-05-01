cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.67"
  sha256 arm:          "d604fb8b329fb3da829c778908e9a1c61efc768b6d9ac4e6b96d17b0595d3a6c",
         x86_64:       "a4737ded33c8819c491be72417f172b641e5c42e3260f86054e9e5be60227412",
         arm64_linux:  "7cad1853cb9327ae0262a0c119cf269bc6cd0d644bdb51a205505533140da252",
         x86_64_linux: "ff9952b3dad1a014751eb13fa5e8398b44bcd0e5a964816c6fdf45485a01f841"

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
