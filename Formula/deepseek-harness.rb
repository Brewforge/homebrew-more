class DeepseekHarness < Formula
  desc "Composable agent harness where everything is a plugin"
  homepage "https://github.com/deepseek-ai/deepseek-harness"
  url "https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-0.1.0-rc.6.tgz"
  sha256 "1b8a9a0ad3c7feaece47926e0bd37ca151c7ccfa997953afa5fd01261784eadc"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@deepseek-ai/dsh/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"
  depends_on "pnpm"

  conflicts_with "dsh", because: "both install a `dsh` executable"

  def install
    # The CLI and its first-party plugin packages are released together.
    # Keep Homebrew's release cooldown for all other npm dependencies.
    system "npm", "install", *std_npm_args,
           "--min-release-age-exclude=@deepseek-ai/*"
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dsh --version")
    assert_match "boot a DeepSeek Harness profile", shell_output("#{bin}/dsh --help")
  end
end
