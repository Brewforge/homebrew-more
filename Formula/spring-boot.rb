class SpringBoot < Formula
  desc "CLI for Spring Boot"
  homepage "https://spring.io/projects/spring-boot"
  url "https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/4.1.0/spring-boot-cli-4.1.0-bin.tar.gz"
  sha256 "48f2db51b0a482adee0e6faadec431ec9d0185f449ceb90bc2d07c2dbc2841e6"
  license "Apache-2.0"
  head "https://github.com/spring-projects/spring-boot.git", branch: "main"

  livecheck do
    url "https://github.com/spring-projects/spring-boot"
    strategy :github_latest
  end

  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files libexec/"bin", Language::Java.overridable_java_home_env
  end

  test do
    system bin/"spring", "--version"
  end
end
