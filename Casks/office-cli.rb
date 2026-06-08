cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.106"
  sha256 arm:          "2df4e0ee7ebe3e23cafc830f68f6e65d5b51936c04c31c56628cb684e74e94fd",
         x86_64:       "347904b118dfa05c6f495d16367d4d73ef902975a667e7bd01d945b10b28d5c2",
         arm64_linux:  "7db734c9132bfaf263d8540ef4d8242fea41ba6c75b96119b47f65c2b0d2f4b2",
         x86_64_linux: "d4dcc69e6b32e4d9550c8b5046f31af44d30642b56e701389610c2dc86771b77"

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
