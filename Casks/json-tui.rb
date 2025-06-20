cask "json-tui" do
  os macos: "Darwin", linux: "Linux"

  version "1.4.1"
  sha256 arm:          "ae673ee914a62ee0421d940c909c128105f622037be9dbd9cdf98e8cfce75144",
         x86_64:       "ae673ee914a62ee0421d940c909c128105f622037be9dbd9cdf98e8cfce75144",
         arm64_linux:  "6e41404cd78933188d34f2620b5a18666e9a591b3ef3dbdfa081950b7492f6a9",
         x86_64_linux: "6e41404cd78933188d34f2620b5a18666e9a591b3ef3dbdfa081950b7492f6a9"

  url "https://github.com/ArthurSonzogni/json-tui/releases/download/v#{version}/json-tui-#{version}-#{os}.tar.gz"
  name "json-tui"
  desc "JSON terminal UI made in C++"
  homepage "https://github.com/ArthurSonzogni/json-tui"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "json-tui-#{version}-#{os}/bin/json-tui"
end
