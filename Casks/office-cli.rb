cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.66"
  sha256 arm:          "f9cec2695e8444f07319bcb2bc99b00f82b4e2274c01d610b00bae5b8193b5ed",
         x86_64:       "c8b59132361a11a9663acd26195bcdddd6af4732e0ac49e4812356cb2a3346ea",
         arm64_linux:  "618a1f699e1d06fed8fe194688743d0fd9763b34adf15a8f1962729d668978f7",
         x86_64_linux: "23dfbd34d97fd5e3cbccafa71af363a93f27bb2e7981b7ed4d624c0086a6dd75"

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
