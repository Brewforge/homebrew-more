cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.0"
  sha256 arm:          "2fbe3d2bb6300da1b1f412af83ceabee757a5c739e579260160e753214d80783",
         x86_64:       "159cb1fa035510e7c670940fa2abc42888b1a0490d4f68fbbe8115c4029e61dd",
         arm64_linux:  "80427fcb68d642b1f3d39acc76726d7ceea828852b75ddc9acd31f7db7f96431",
         x86_64_linux: "a7acc72743a7560a136915899e73886c629c8d84b1b84df07845ea0f0a4a591f"

  url "https://github.com/biliup/biliup/releases/download/v#{version}/biliupR-v#{version}-#{arch}-#{os}.tar.xz",
      verified: "github.com/biliup/biliup/"
  name "biliupR"
  desc "哔哩哔哩命令行投稿和视频下载工具"
  homepage "https://biliup.github.io/biliup/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "biliupR-v#{version}-#{arch}-#{os}/biliup", target: "biliup"
end
