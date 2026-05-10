cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.81"
  sha256 arm:          "beb6fc7e214988682789bb76b4de344b44e20c8ccc6bf4516214b712720f945d",
         x86_64:       "e4b5dc064a68d2a8f7c3704715b4fc22553ab68bd47c6754823b2c85db245c6d",
         arm64_linux:  "8e61bbf0ed3f081c6c48c322c1dcdfa6e3220431146bc7a1bc4baab7d98d9bd3",
         x86_64_linux: "10cafc681214d067405a5e07176ddd5d3aa1720b2107b26edc7a105f1f23a4d0"

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
