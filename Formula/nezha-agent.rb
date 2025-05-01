class NezhaAgent < Formula
  desc "Agent of Nezha Monitoring"
  homepage "https://nezha.wiki/"
  url "https://github.com/nezhahq/agent/archive/refs/tags/v1.10.0.tar.gz"
  sha256 "11469729965ee43f0739383811a0d2d87285486c6a68bd4616cbcea275b9a7ec"
  license "Apache-2.0"
  head "https://github.com/nezhahq/agent", branch: "main"

  depends_on "go" => :build

  def install
    arch = Hardware::CPU.arch.to_s
    ldflags = %W[
      -s -w
      -X github.com/nezhahq/agent/pkg/monitor.Version=#{version}
      -X main.arch=#{arch}
    ]
    system "go", "generate", "./..."
    system "go", "build", *std_go_args(ldflags:), "./cmd/agent"
  end

  service do
    run [opt_bin/"nezha-agent", "--password", ENV["HOMEBREW_NEZHA_AGENT_PASSWORD"].to_s, "--server",
         ENV["HOMEBREW_NEZHA_AGENT_SERVER"].to_s]
    keep_alive true
    environment_variables({
      HOMEBREW_NEZHA_AGENT_PASSWORD: ENV["HOMEBREW_NEZHA_AGENT_PASSWORD"],
      HOMEBREW_NEZHA_AGENT_SERVER:   ENV["HOMEBREW_NEZHA_AGENT_SERVER"],
    })
  end

  def caveats
    <<~EOS
      请先添加环境变量
        echo 'export HOMEBREW_NEZHA_AGENT_PASSWORD="你的密钥，在你的服务页面获取"' >> ~/.zshrc
        echo 'export HOMEBREW_NEZHA_AGENT_SERVER="你的服务器和端口，格式 your.domain:5555 "' >> ~/.zshrc
        source ~/.zshrc
      再安装本命令行服务，否则会导致无法向服务配置中初始化密钥和服务器参数。

      若已安装，并遇到错误，则请运行
        brew services stop nezha-agent
        brew reinstall nezha-agent
        brew services start nezha-agent
    EOS
  end

  test do
    system bin/"nezha-agent", "-h"
  end
end
