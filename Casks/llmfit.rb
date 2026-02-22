cask "llmfit" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.3.8"
  sha256 arm:          "243375d90a8edca1bd83ddcb1d2b5c8ce5f9649ec13c9ebe8f78d67eb6e27149",
         x86_64:       "40be9ea73a91c1673d48cd53547f3c6c74ab4fd58564b15ea3a986ad060f0228",
         arm64_linux:  "46eaca1af1c75039fdb0b60d5f33fe4c5330163e5324a5fe43358a003951778f",
         x86_64_linux: "e6a51aadfa192f09c594d8f94f6f6a7590269b564900184f0ef2862bc0228846"

  url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-#{arch}-#{os}.tar.gz"
  name "llmfit"
  desc "One command to find what runs on your hardware"
  homepage "https://github.com/AlexsJones/llmfit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "llmfit-v#{version}-#{arch}-#{os}", target: "llmfit"
end
