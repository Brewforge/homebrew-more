cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.69"
  sha256 arm:          "ca92c7fc2f177622c0e54bcc5d47fffccb911faa462cfba32a6d12e9453634f1",
         x86_64:       "145271c95208673d9457d48561495dbb03dff3b603a844f721d719fcf6546e5e",
         arm64_linux:  "d67af74918e12e0751cc813f73d69560a1cf4d78b3f10ce3bff84323dfc08e07",
         x86_64_linux: "79a5d8bef03d6944ac5feeb2da6ccefd214fe9142c08b679c631a791f3ab9123"

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
