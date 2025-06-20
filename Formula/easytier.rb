class Easytier < Formula
  desc "Simple, decentralized mesh VPN with WireGuard support"
  homepage "https://easytier.cn/"
  url "https://github.com/EasyTier/EasyTier/archive/refs/tags/v2.3.2.tar.gz"
  sha256 "bd1b3345346468555e473d0244b7672caf41c7b7d581469729f0e2b4bae826b8"
  license "Apache-2.0"
  head "https://github.com/EasyTier/EasyTier", branch: "main"

  depends_on "rust" => :build
  depends_on "protobuf"

  def install
    system "cargo", "install", *std_cargo_args(path: "easytier")
  end

  def caveats
    <<~EOS
      ⚠️ EasyTier requires root privileges to create TUN/utun devices.

      If your configuration uses TUN or WireGuard (e.g. includes wg:// listeners),
      you must start the service with root privileges:

          sudo brew services start easytier

      Note: This will change ownership of some EasyTier-related paths to root,
      which may require manual removal using `sudo rm` during future upgrades,
      reinstalls, or uninstalls.
    EOS
  end

  service do
    run [opt_bin/"easytier-core", "-c", "~/.config/easytier/config.toml"]
    keep_alive true
    require_root true
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
