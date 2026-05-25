cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.97"
  sha256 arm:          "59a3b170ed8825d7489bb2084d9ece75e281dbf7524cd69d046377b1e2e449f6",
         x86_64:       "10759f8e5c2b0c87079f099eee4118c3fab572c21266b5bdfccb6e6717fdd674",
         arm64_linux:  "d207140a629d263df6eb0844594e9ab53a0a7c0a9266258f1d0e616145d12f35",
         x86_64_linux: "fbd854c29a1f515ac39746c911c6e6755b51f3d117538cec6e01efadf514bc10"

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
