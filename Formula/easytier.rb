class Easytier < Formula
  desc "Simple, decentralized mesh VPN with WireGuard support"
  homepage "https://easytier.cn/"
  url "https://github.com/EasyTier/EasyTier/archive/refs/tags/v2.2.4.tar.gz"
  sha256 "2c2d0af6db48d62d57ae26486c2f3a69b98f7a6bc5097c073266e7d09fb1ccb4"
  license "Apache-2.0"
  head "https://github.com/EasyTier/EasyTier", branch: "main"

  depends_on "rust" => :build
  depends_on "protobuf"

  def install
    system "cargo", "install", *std_cargo_args(path: "easytier")
  end

  service do
    run [opt_bin/"easytier-core", "-c", "~/.config/easytier/config.yaml"]
    keep_alive true
    working_dir var
    log_path var/"log/easytier.log"
    error_log_path var/"log/easytier.log"
  end

  test do
    system bin/"easytier-core", "-h"
    system bin/"easytier-cli", "-h"
    system bin/"easytier-web", "-h"
  end
end
