cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.93"
  sha256 arm:          "b4727c707fd101c9f09905dba9e80e801cc065a7fc21ce1868d47429730dff02",
         x86_64:       "868317964468b066acdd20f3f5ceafba683cdd02c79d8a45000a8108b5eed9c3",
         arm64_linux:  "f319849b8a9905f9b936700bb1f2d0e9ad099e8abef584206148b0b600710a01",
         x86_64_linux: "11ac7f85c9f2f82adc266a97a353c362c87d48a5812a2552b133324dc922d102"

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
