class ExcalidrawConverter < Formula
  desc "Command-line tool for porting Excalidraw diagrams to Gliffy"
  homepage "https://github.com/sindrel/excalidraw-converter"
  url "https://github.com/sindrel/excalidraw-converter/archive/refs/tags/v1.4.3.tar.gz"
  version "1.4.3"
  sha256 "e1d6d54b44a7fd72b461224ba2ff2db9349c1433877d486ddddf97db6c85350f"
  license "MIT"
  head "https://github.com/sindrel/excalidraw-converter.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "go", "test", "-v", "./..."
  end
end
