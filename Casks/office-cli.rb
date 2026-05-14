cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.91"
  sha256 arm:          "6d3355a6ae69b87e9788c5886d8baca87ba563ba5707a234f40a1c4c02422152",
         x86_64:       "f4983d469d2627fd8e147fb266ce63a03c692ed8aaa6389780603c7248cc20a0",
         arm64_linux:  "39561de0121e46a132f73751cba7656878ad1ade64b58e73f1ee9e1583c83670",
         x86_64_linux: "3830a525e51d4b7b22af8875e84ff7b34b63e1bb09c223169c91e9666043cb1e"

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
