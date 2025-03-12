class Shiroa < Formula
  desc "Simple tool for creating modern online books in pure typst"
  homepage "https://myriad-dreamin.github.io/shiroa/"
  url "https://github.com/Myriad-Dreamin/shiroa/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "724f5247fb40e9adedae133c0ce103a7b2ab91fa97e704d6bea544ce63559488"
  license "Apache-2.0"
  head "https://github.com/Myriad-Dreamin/shiroa.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "git", "submodule", "update", "--init", "--recursive" if build.head?
    system "cargo", "install", "--path", "./cli"
  end

  test do
    system "#{bin}/shiroa", "init", "mybook"

    cd testpath/"mybook" do
      system bin/"shiroa", "build"
    end

    assert_equal "<a href=\"/sample-page.html\" class=\"active\">Hello, typst</a>",
      (testpath/"mybook/dist/index.html").read.strip
  end
end
