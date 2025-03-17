class ExcalidrawConverter < Formula
  desc "Command-line tool for porting Excalidraw diagrams to Gliffy"
  homepage "https://github.com/sindrel/excalidraw-converter"
  url "https://github.com/sindrel/excalidraw-converter/archive/refs/tags/v1.4.3.tar.gz"
  sha256 "e1d6d54b44a7fd72b461224ba2ff2db9349c1433877d486ddddf97db6c85350f"
  license "MIT"
  head "https://github.com/sindrel/excalidraw-converter.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    resource "test_input.excalidraw" do
      url "https://raw.githubusercontent.com/sindrel/excalidraw-converter/refs/heads/master/test/data/test_input.excalidraw"
      sha256 "46fd108ab73f6ba70610cb2a79326e453246d58399b65ffc95e0de41dd2f12e8"
    end

    resource("test_input.excalidraw").stage testpath
    system bin/"excalidraw-converter", "gliffy", "-i", testpath/"test_input.excalidraw", "-o",
testpath/"test_output.gliffy"
    assert_path_exists testpath/"test_output.gliffy"
  end
end
