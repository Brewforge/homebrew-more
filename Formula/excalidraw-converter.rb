class ExcalidrawConverter < Formula
  desc "Command-line tool for porting Excalidraw diagrams to Gliffy"
  homepage "https://github.com/sindrel/excalidraw-converter"
  version "1.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/sindrel/excalidraw-converter/releases/download/v1.4.3/excalidraw-converter_1.4.3_darwin_amd64.tar.gz"
      sha256 "b3b0490a4294fcb4b1e3defa5ce75d03ea1e4230168033d1f1d308bb36e1f595"

      def install
        bin.install "exconv"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/sindrel/excalidraw-converter/releases/download/v1.4.3/excalidraw-converter_1.4.3_darwin_arm64.tar.gz"
      sha256 "e5f094ae7f76c07b1b7a2c3605c882eaed76f84b1ccc4e3791ce00c180be75da"

      def install
        bin.install "exconv"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/sindrel/excalidraw-converter/releases/download/v1.4.3/excalidraw-converter_1.4.3_linux_amd64.tar.gz"
      sha256 "90042133030a48e3d8a445ac56b278253072c1ef2817ee706f674c825f44ba5f"

      def install
        bin.install "exconv"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/sindrel/excalidraw-converter/releases/download/v1.4.3/excalidraw-converter_1.4.3_linux_armv6.tar.gz"
      sha256 "114801dce461004e85e3e0a61b5dc53ed902314b545c3ec17a7a3b7f32a509d8"

      def install
        bin.install "exconv"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/sindrel/excalidraw-converter/releases/download/v1.4.3/excalidraw-converter_1.4.3_linux_arm64.tar.gz"
      sha256 "5e6b7e35061562d088dcab8a0b3fed63da7f788b880cc2fa404619a1786a4d8f"

      def install
        bin.install "exconv"
      end
    end
  end

  test do
    system "#{bin}/exconv", "version"
  end
end
