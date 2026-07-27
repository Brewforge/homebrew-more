cask "ft-cli" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  version "1.0.8"
  sha256 arm:          "cd6066d150aee074e8430b4426f8a8fb558961c1179c01a10440da705821e392",
         x86_64:       "a6dba04ae7d94f2d1d1282b2893e841643da95eddb2e02ea6e4a10d7c3250f8c",
         arm64_linux:  "9edfe20e8f7398d1dd063ade3b1afeb65a82823f305cf9d8eaaa28909ffce3f1",
         x86_64_linux: "3048165cc225b7513bd5f2ddc200e46e6683fe465cdf36670014f21cd50c2e71"

  url "https://github.com/huanguan1978/ft/releases/download/v#{version}/ft-#{os}-#{arch}-#{version}.zip"
  name "ft"
  desc "High-performance CLI file management and automation tool (FileTools)"
  homepage "https://github.com/huanguan1978/ft"

  binary "build/ft-#{version}-#{os}-#{arch}", target: "ft"

  caveats <<~EOS
    ft (FileTools) is a high-performance, cross-platform CLI tool
    for file management and workflow automation. It excels at
    precision file discovery using glob patterns, file states
    (time, size), and MIME-type detection. Beyond discovery,
    ft supports regex-based search-and-replace, and enables
    complex batch processing via built-in subcommands or by
    orchestrating native system CLI applications as a universal
    shell task runner.

    To learn more about how ft empowers you to bypass the limitations of
    standard shell scripts and toolchains, please explore our FAQ:
    https://github.com/huanguan1978/ft/blob/main/doc/en/FAQ.md
  EOS
end
