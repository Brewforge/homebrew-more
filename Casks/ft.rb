cask "ft" do
  arch arm: "arm64", intel: "x64"
  os macos: "macos", linux: "linux"

  version "1.0.7"
  sha256 arm:         "4be85c6c8d27ea0e7cbba59a868ffb066d5a8a95bda7e47e61b46a7dce83aafc",
         x86_64:      "54688bfb3c8716871a36325e8a36e2d0af3fe0ecd2d1f4a08c404104195e6542",
         arm64_linux: "fe9ab6edf6aea31a3e7a7ef1dadc09f6dbf66f00a48edc74ee1d6ed0d65b8e9f",
         x86_64_linux: "6b1ae2ed2c64cf35e3b6be0eda7e6b92bc6de4ed0ee7ca04c92fd3d0fcccb3f8"

  url "https://github.com/huanguan1978/ft/releases/download/v#{version}/ft-#{os}-#{arch}-#{version}.zip",
      verified: "github.com/huanguan1978/ft/"

  name "ft"
  desc "High-performance CLI file management and automation tool (FileTools)"
  homepage "https://github.com/huanguan1978/ft"

  binary "build/ft-#{version}-#{os}-#{arch}"

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