class Chapose < Formula
  desc "Modern High-Performance File Security Tool"
  homepage "https://github.com/huanguan1978/chacrypt"
  url "https://github.com/huanguan1978/chacrypt/archive/refs/tags/chapose-v1.0.0.tar.gz"
  sha256 "747d9edcd4d26dcdb6b6905763672e1e864ba9029e8c50b7a696c1c079ebce0a"
  license "LGPL-2.1-only"

  head "https://github.com/huanguan1978/chacrypt", branch: "main"

  livecheck do
    url "https://github.com/huanguan1978/chacrypt/tags"
    regex(/^chapose-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "dart-sdk" => :build

  def install
    cd "chapose" do
      system "dart", "pub", "get"
      system "dart", "compile", "exe", "bin/chapose.dart", "-o", "chapose"
      bin.install "chapose"
    end
  end

  test do
    system bin/"chapose", "--version"
  end
end
