cask "office-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "mac", linux: "linux"

  version "1.0.94"
  sha256 arm:          "76412b20c5619db05a39561b8775759a1a6aa1f309f5782fedbd03d8b478b5c4",
         x86_64:       "747102e45344dc3acab9d4c4ef1138913d5f14d3ee1f11bd2343462805458c00",
         arm64_linux:  "e13526216d60b8ec2fea761ccfffa3e31a466656421acb1eda76a4941d4f557f",
         x86_64_linux: "a11e08d7987fc248fb3fac617fc3391fd20d993c20c3f9de8090d10fa6a0fd3f"

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
