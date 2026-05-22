cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.96"
  sha256 arm:          "b1f794dcd93a2ffc16fbe811a84f434c9131455619f87e3e2721230eb13a5dbe",
         x86_64:       "b39e6dc06b22142d13f731b8767ae13a3ea2c79963e858bdfeb6811d4043d147",
         arm64_linux:  "128ae213e8ac2a704205b00126dc20f9eb4f6b1b558e19e039cdf117b5696d94",
         x86_64_linux: "68bb5a509f869b1739b292e0fdb6b520f0a51cc3d347dffa0a5d746be925564f"

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
