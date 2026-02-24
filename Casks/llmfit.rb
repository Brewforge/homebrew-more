cask "llmfit" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.4.3"
  sha256 arm:          "9bb95e286aaa786fbd2841890550b426f9b5fcd0f1469ae697d2798a4b728d93",
         x86_64:       "efe87628bc933c874af3091cea43a4ae8dae0a7b9104908877ac3c2abdf2df03",
         arm64_linux:  "5d8d6ac352ed457ba11cbae3b97c8bba5992188e912f7d5ed364e61394d8125c",
         x86_64_linux: "726a93a9733f0e1272d0bad5d8543786f42c35150e8b93e52b0b629b835544c8"

  url "https://github.com/AlexsJones/llmfit/releases/download/v#{version}/llmfit-v#{version}-#{arch}-#{os}.tar.gz"
  name "llmfit"
  desc "One command to find what runs on your hardware"
  homepage "https://github.com/AlexsJones/llmfit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "llmfit-v#{version}-#{arch}-#{os}/llmfit", target: "llmfit"
end
