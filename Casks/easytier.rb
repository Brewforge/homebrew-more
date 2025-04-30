cask "easytier" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "2.2.4"
  sha256 arm:          "b969938af06aba0a8bc913d4975302c5433305c42c48c31815382ae3ff0c8e1a",
         x86_64:       "262c15ca7890898560d00e5ffd5ada1864fbd9d0d58ac4ee492c9f3e73f3ae5f",
         arm64_linux:  "5bb1ab8987a33be08ad07367d2e70ea4f18868ba4538a77019aba48e76ed7892",
         x86_64_linux: "ec233b7d8d40b1cc4447dac05be343f53a757dc605743a8808abaa8e97e5d10e"

  url "https://github.com/EasyTier/EasyTier/releases/download/v#{version}/easytier-#{os}-#{arch}-v#{version}.zip",
      verified: "github.com/EasyTier/EasyTier/"
  name "easytier"
  desc "Simple, decentralized mesh VPN with WireGuard support"
  homepage "https://easytier.cn/"

  binary "easytier-#{os}-#{arch}/easytier-core"
  binary "easytier-#{os}-#{arch}/easytier-cli"
  binary "easytier-#{os}-#{arch}/easytier-web"
  service do
    run [opt_bin/"easytier-core", "-c", "~/.config/easytier/config.yaml"]
    keep_alive true
    working_dir var
    log_path var/"log/easytier.log"
    error_log_path var/"log/easytier.log"
  end
end
