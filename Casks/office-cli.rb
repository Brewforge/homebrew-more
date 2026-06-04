cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.103"
  sha256 arm:          "4071026e38aad81cdace0c7beed8ad0e425b8acd01872734e168f3868d303066",
         x86_64:       "8d1dc7a8b5271ce6dd7124406da4f938bcb91e9dae5f9c6bb3782a9d394060ec",
         arm64_linux:  "4118622c65df95a8dc722a2a46145239e1b9974162fbd96d4ad012c3438f8564",
         x86_64_linux: "76c7f1b31a1d2c29a6eca640d7166226cf3072f6dc57f9eb49d1e46fee9f1f36"

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
