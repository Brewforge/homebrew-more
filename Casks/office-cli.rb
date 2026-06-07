cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.105"
  sha256 arm:          "c2991ade6f9b73a15cf88be8c7f44daa12e3f7331a55135d895cbe289a8d5726",
         x86_64:       "209cfb613b2d3dd6b8dfee38498aee912dbe76bd71c72ae2692cfad591bb35bc",
         arm64_linux:  "f5233be2fd57b1abd6e37c2abdef83a09a668b5e10a2c730d55ef9e9cf35cff4",
         x86_64_linux: "50ce7556bd45db00e4e4a8e44a4b56526023f455b318a2e94a8cb7da653d0baf"

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
