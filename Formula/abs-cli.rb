class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.4/abs-cli-osx-arm64"
      sha256 "94fa393c9a7623a7206bd060b54231c6b366f63e9718bd5a300f2abf806d2356"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.4/abs-cli-osx-x64"
      sha256 "a1e2cda5e847d8fcdef1cf3afeb6ea447cf2a19d26efb531082204ba13cb6dfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.4/abs-cli-linux-arm64"
      sha256 "3d52778eecd7b91923a261ad4d35e3e6d8c0e9d0822ef747920563e5eda2c9b5"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.4/abs-cli-linux-x64"
      sha256 "84d3c618c68086c334d7852e1151e88213cf0cceb2e3160f7b8b4423529960e1"
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
