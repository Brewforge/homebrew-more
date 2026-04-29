cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.63"
  sha256 arm:          "3ede6c3457f050f2d06d95895d7a3391183911ad729c61df990d4e27c1067510",
         x86_64:       "839f6030e6fdf12b365ed632fe0de5955b26403cfecfc1594d9f950112c42707",
         arm64_linux:  "cc0462bcbf7af1a83973db4b8598372595aa9ac7658431af6bb1ae94f8d9c9db",
         x86_64_linux: "59efd550089b75556660624f5326be8e86ef4a447d20f8bd7617cf79ceb13b15"

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
