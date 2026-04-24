class Ft < Formula
  desc "High-performance CLI file management and automation tool (FileTools)"
  homepage "https://github.com/huanguan1978/ft"
  url "https://github.com/huanguan1978/ft/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "c529d5162daaf587e808c1063c7f5010ba4af894ea37b09acd2fa7dad254d1eb"
  license "LGPL-2.1"

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
