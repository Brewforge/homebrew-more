cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.3.4"
  sha256 arm:          "1bfdb13a092600907e6111c0ed08c30af4abe5c8ed0b041e6d98b94efe376d46",
         x86_64:       "a829852f5f120e408a895bba0bce0508566aab414718ce5e3089abb87835f6d3",
         arm64_linux:  "f2c6813f44e6cb758af14df46a54e21210e087caf148bf677cba3091c2597f18",
         x86_64_linux: "c842430e242234766b0a7de92c761f2ead6aad4667b35873332a4d8745d6c952"

  url "https://github.com/biliup/biliup/releases/download/v#{version}/biliupR-v#{version}-#{arch}-#{os}.tar.xz"
  name "biliupR"
  desc "哔哩哔哩命令行投稿和视频下载工具"
  homepage "https://biliup.github.io/biliup/"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "biliupR-v#{version}-#{arch}-#{os}/biliup", target: "biliup"
end
