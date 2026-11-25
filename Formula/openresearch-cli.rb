class OpenresearchCli < Formula
  desc "CLI for the OpenResearch local-first research agent workspace"
  homepage "https://openresearch.sh"
  # Declared explicitly: each per-arch URL only resolves once `version` is known.
  version "0.2.30"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/alphaXiv/OpenResearch/releases/download/v#{version}/openresearch-cli-aarch64-apple-darwin.tar.gz"
      sha256 "10e901d4716f1aa5fb9db8429b796f2c1da4e56334d25a07fe85cfceb1485f23"
    end

    on_intel do
      url "https://github.com/alphaXiv/OpenResearch/releases/download/v#{version}/openresearch-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6672f1a96a6cef228e91bfc03fbe83d0a3f662814cae83da9f6a10bb88f2cc0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alphaXiv/OpenResearch/releases/download/v#{version}/openresearch-cli-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e07b12714029b58d05a0d20c1d3c73a68a4035ee7a6dc89f75c2eeaeddbf75d8"
    end

    on_intel do
      url "https://github.com/alphaXiv/OpenResearch/releases/download/v#{version}/openresearch-cli-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5fe06a3f912a12d3a4cb1a9c2469f12f14281188574ce80d758a26d9d8201a2f"
    end
  end

  def install
    bin.install "orx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orx --version")
  end
end
