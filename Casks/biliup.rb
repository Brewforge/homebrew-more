cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.8"
  sha256 arm:          "b7197b679530a223c6eb04df54543178c316d502f392015dff11bbd960ef5b54",
         x86_64:       "65b23c470409a3ef2ec077f14d3dc7b3491dc4c967f957aa1787d6113c8fbe56",
         arm64_linux:  "5271cb1d075fc8b31c85d9892d98b07cb34e6f613bb08b7a8b9368f875250320",
         x86_64_linux: "60adc7c377ed5bc64cf48ab7ee98b6f486ced9e5ea24855246d49a8c46f9af76"

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
