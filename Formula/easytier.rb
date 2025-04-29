class Easytier < Formula
  desc "一个简单、安全、去中心化的内网穿透 SD-WAN 异地组网方案"
  homepage "https://easytier.cn/"
  url "https://github.com/EasyTier/EasyTier/releases/download/v2.2.4/easytier-macos-aarch64-v2.2.4.zip"
  sha256 "b969938af06aba0a8bc913d4975302c5433305c42c48c31815382ae3ff0c8e1a"
  license "Apache-2.0"

  def install
    bin.install "easytier-core"
    bin.install "easytier-cli"
    bin.install "easytier-web"
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
