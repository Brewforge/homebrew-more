cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.89"
  sha256 arm:          "c1ffe1fe5d8765a82ea1fe5375f647abb93c5e8f275836cdc8926d706b012c1c",
         x86_64:       "42f680bc824b4f5218c81dffbe0d790bd421313626cbd618308dd46d1fa6f63a",
         arm64_linux:  "afbc5b83d625a70849e0c744287d75c017ebb239ffb354ad8b5c8bfdc7e5294c",
         x86_64_linux: "c0db41e14c39fc0b3610f179ea88247a86410cbcc59524718878da69b6776458"

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
