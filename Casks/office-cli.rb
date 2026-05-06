cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.73"
  sha256 arm:          "f02f2d45da87cc49618ded3c4accf64195546550d3ee6a1613950f6c322a4f3d",
         x86_64:       "934f4e3e277d3000c92f7668d2be88c54f858f8191813f4af4571e411e9ae734",
         arm64_linux:  "fe5d7657a2dcdeafa96e7fd0e366cfb1b588709446569a17ed87357f08f1940b",
         x86_64_linux: "a0a55e84bd0894a9df9e7cfcbb855a94eb4f86ba6f7fcc155727ba6a4f185adc"

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
