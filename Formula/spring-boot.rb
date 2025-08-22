class SpringBoot < Formula
  desc "CLI for Spring Boot"
  homepage "https://spring.io/projects/spring-boot"
  url "https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/3.5.5/spring-boot-cli-3.5.5-bin.tar.gz"
  sha256 "144e9f72a1e14cb1de30487c7d76abbe2053b65995867e86985b87c33708ebc3"
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
