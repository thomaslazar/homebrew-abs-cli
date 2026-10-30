class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.1/abs-cli-osx-arm64"
      sha256 "c448ef9db0a59d53cd9480c9e598088892f3d2116ab6c109bccda59e0a252851"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.1/abs-cli-osx-x64"
      sha256 "248f43b24db3bc3ea1f4a3604112ffe991c3f76b5948be66ec3ec436249e5c24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.1/abs-cli-linux-arm64"
      sha256 "ac8f3397c161e3052d77d3f1deae40c9b9a2752eeb5af70829e16c5f64431d93"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.1/abs-cli-linux-x64"
      sha256 "4d04ed8ba6c41e900ef0f0d288d27d446f7993678e58070280ded68f222f00f3"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "abs-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abs-cli --version")
  end
end
