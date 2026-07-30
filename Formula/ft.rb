class Ft < Formula
  desc "High-performance CLI file management and automation tool (FileTools)"
  homepage "https://github.com/huanguan1978/ft"
  url "https://github.com/huanguan1978/ft/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "e7b30870053a9369d84f40402ee41fd06cd7700facf2f4cfec273aa52423bb91"
  license "LGPL-2.1-only"

  head "https://github.com/huanguan1978/ft", branch: "main"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on "dart-sdk" => :build

  def install
    system "dart", "pub", "get"
    system "dart", "compile", "exe", "bin/ft.dart", "-o", "ft"
    bin.install "ft"
  end

  test do
    system bin/"ft", "--version"
  end
end
