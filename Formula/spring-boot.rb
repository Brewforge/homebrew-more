class SpringBoot < Formula
  desc "CLI for Spring Boot"
  homepage "https://spring.io/projects/spring-boot"
  url "https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/4.0.0/spring-boot-cli-4.0.0-bin.tar.gz"
  sha256 "592fd017637521b9bd50e7cdabb2b8335190eb0c81f937f706bcf1e076086743"
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
