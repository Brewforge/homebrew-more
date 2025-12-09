class Reportgen < Formula
  desc "生成报告"
  homepage "https://github.com/Mrered/Gobin"
  url "https://github.com/Mrered/Gobin/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "4960dc0dc69521ed6e7bb3caf50561d7cd5957b2be803ea36262afafebba4906"
  license "MIT"
  head "https://github.com/Mrered/Gobin.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/reportgen"
  end

  test do
    system bin/"reportgen", "-v"
  end
end
