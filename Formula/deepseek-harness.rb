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

  on_linux do
    depends_on "python@3.14" => :build
  end

  conflicts_with "dsh", because: "both install a `dsh` executable"

  def install
    # The CLI and its first-party plugin packages are released together.
    # Keep Homebrew's release cooldown for all other npm dependencies.
    system "npm", "install", *std_npm_args(ignore_scripts: false),
           "--min-release-age-exclude=@deepseek-ai/*"
    bin.install_symlink libexec.glob("bin/*")

    node_modules = libexec/"lib/node_modules/@deepseek-ai/dsh/node_modules"
    rm_r node_modules/"node-pty/third_party"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dsh --version")
    assert_match "boot a DeepSeek Harness profile", shell_output("#{bin}/dsh --help")

    node_pty = libexec/"lib/node_modules/@deepseek-ai/dsh/node_modules/node-pty"
    (testpath/"pty-test.cjs").write <<~JAVASCRIPT
      const pty = require(#{node_pty.to_s.dump});
      const child = pty.spawn("/bin/sh", ["-c", "printf dsh-pty-ok"]);
      let output = "";
      child.onData(data => output += data);
      child.onExit(({ exitCode }) => {
        process.stdout.write(output);
        process.exit(exitCode);
      });
    JAVASCRIPT
    assert_match "dsh-pty-ok", shell_output("#{formula_opt_bin("node")}/node pty-test.cjs")

    (testpath/"native-modules-test.cjs").write <<~JAVASCRIPT
      require(#{(node_pty.parent/"koffi").to_s.dump});
      require(#{(node_pty.parent/"sharp").to_s.dump});
      require(#{(node_pty.parent/"node-addon-require-builtin").to_s.dump});
    JAVASCRIPT
    system formula_opt_bin("node")/"node", "native-modules-test.cjs"

    ENV["DSH_HOME"] = testpath
    output = shell_output("#{bin}/dsh plugin --profile test --version 2>&1")
    assert_match Formula["pnpm"].version.to_s, output
    assert_path_exists testpath/"profiles/test/package.json"
  end
end
