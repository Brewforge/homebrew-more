cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.60"
  sha256 arm:          "a575eb4559b53ad13e6659e07f160fccd92851cfc5f48c689687a5d7e07ede70",
         x86_64:       "c5ea481ccf6187ab172d3cc67a76f1c127b5361cf078e7a247bce65b3e58e591",
         arm64_linux:  "17fc577a96b32f5ea585d38411b53e8fc231a4cae220fe5d5aa1824be7f6b770",
         x86_64_linux: "38446d60bc5398ea3cd9cb322ab0531dad92668790be6ce1e91c04c0a0058f6c"

  url "https://github.com/iOfficeAI/OfficeCLI/releases/download/v#{version}/officecli-#{os}-#{arch}"
  name "office-cli"
  desc "Office CLI Tool"
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
