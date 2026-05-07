cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.75"
  sha256 arm:          "592635ce948a260c1f9703ec28a6a17e560af7426ec72cb3ac52f5dd3a95b9c9",
         x86_64:       "686520459fc56779256e514a95548cc7db751bca31bebc1ed01bed4fe0d6e05b",
         arm64_linux:  "64c948599994bc01307033ac19fdaec2bb383b57e9dcfdced19b09babd962eb8",
         x86_64_linux: "8a33b22fd5291c28ecf06ec70745ce389dec60bac7809ebfd488aeedf95f27bc"

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
