class Easytier < Formula
  desc "Simple, decentralized mesh VPN with WireGuard support"
  homepage "https://easytier.cn/"
  url "https://github.com/EasyTier/EasyTier/archive/refs/tags/v2.4.3.tar.gz"
  sha256 "7079522fde96ea4c1089aa89eb24bb6829f4c74dbce0ee8d3b6825cd6df3baba"
  license "Apache-2.0"
  head "https://github.com/EasyTier/EasyTier", branch: "main"

  livecheck do
    url :url
    strategy :github_latest
  end

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
