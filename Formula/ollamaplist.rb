class Ollamaplist < Formula
  desc "给通过 Homebrew 安装的 Ollama CLI 工具添加环境变量"
  homepage "https://github.com/Mrered/Gobin"
  url "https://github.com/Mrered/Gobin/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "4960dc0dc69521ed6e7bb3caf50561d7cd5957b2be803ea36262afafebba4906"
  license "MIT"
  head "https://github.com/Mrered/Gobin.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ollamaplist"
  end

  test do
    system bin/"ollamaplist", "-v"
  end
end
