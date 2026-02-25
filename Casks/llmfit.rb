cask "llmfit" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-gnu"

  version "0.4.5"
  sha256 arm:          "6c328e9f376dc5271088d492b24acc7278b83e5e123340743cb69c0e5bcd5635",
         x86_64:       "21af53420df506bdd4477d72438bb1371aa9c89bec64e6f3026804e848fd678c",
         arm64_linux:  "ea012d516ae41d0242951fa2fb5ea9d8d2e1845ff939a2ef5624864a06447632",
         x86_64_linux: "34cabf0c9fd8422e34220e2de1a6f476ef6abdc114fef9a6be85ef31973d53bc"

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
