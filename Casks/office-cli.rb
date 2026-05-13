cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.90"
  sha256 arm:          "7f5a2e1536904c7032ad9822085a0a018459eb0de241343c95cf107814d44cc4",
         x86_64:       "8af13f677393f8cd7fbaeef2f933e3dda7ce4b65bf11f4fb171d44ef359d969e",
         arm64_linux:  "1b265d9bb2097aa8c73657f95574dda209de4e9ba90f11f3a416203ea2dbabdf",
         x86_64_linux: "932d995b630916b097e4fd6acf6ea8158b2ccf02258803421829848d0c2ef036"

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
