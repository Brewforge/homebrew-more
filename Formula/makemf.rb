class Makemf < Formula
  desc "为 GGUF 文件生成 Makefile"
  homepage "https://github.com/Mrered/Gobin"
  url "https://github.com/Mrered/Gobin/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "3e64d7741b4113ecb8fb002609e276fba8c0ee5e7771fd99def29dab0c669b5e"
  license "MIT"
  head "https://github.com/Mrered/Gobin.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/makemf"
  end

  test do
    system bin/"makemf", "-v"
  end
end
