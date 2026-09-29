cask "biliup" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "1.2.11"
  sha256 arm:          "0e32d150841755e5c2fd324e9f32864154c94d842cd8ccfc1dceed0f4069f390",
         x86_64:       "d5f0341fc54b6031df8e154e259c5f0d3f8144e18f26632971d8059e2239145a",
         arm64_linux:  "d01bd269120c98537117db02e806d200eaf325592bf29c9e5201c320fd2e6987",
         x86_64_linux: "fa61de34f779459915a3093f529b312d3193b769b37f4db26d7d99316b6a38d5"

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
