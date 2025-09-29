class Easytier < Formula
  desc "Simple, decentralized mesh VPN with WireGuard support"
  homepage "https://easytier.cn/"
  url "https://github.com/EasyTier/EasyTier/archive/refs/tags/v2.4.5.tar.gz"
  sha256 "8bce53d0390bc9b2842bb863de1d4f18e6bb145fa41ec9d49683285e54423b98"
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

      🚀 EasyTier 提供两种服务管理方式：

      方式一：Homebrew 服务管理（推荐入门用户）
        sudo brew services start easytier    # 使用默认配置文件模式（~/.config/easytier/config.toml）

      方式二：原生服务管理（推荐高级用户）
        # 配置文件模式
        sudo #{opt_bin}/easytier-cli service install -c /path/to/config.toml

        # 命令行参数模式（支持工作组和机器ID）
        sudo #{opt_bin}/easytier-cli service install -w username --machine-id machine_id

        # 管理原生服务
        sudo #{opt_bin}/easytier-cli service start
        sudo #{opt_bin}/easytier-cli service stop
        sudo #{opt_bin}/easytier-cli service status

      💡 原生服务管理支持更多高级功能和参数配置。

      Note: 使用 root 权限可能需要在升级时手动清理相关文件。
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
    system bin/"easytier-web-embed", "-h"
  end
end
