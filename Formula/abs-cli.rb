class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.3/abs-cli-osx-arm64"
      sha256 "04debf548e19421277fd562e2b3aef2cb2a7b3980e58f6237b8034d282b1da6f"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.3/abs-cli-osx-x64"
      sha256 "4a8805e3437c2885c82b7df6fab947483a30208be6329695b4b405b79106b40e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.3/abs-cli-linux-arm64"
      sha256 "4ff9d74023315ce210c9e562e8e11ef173477614ae6a11e861062875a3118df7"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.3/abs-cli-linux-x64"
      sha256 "522ee6c7f8924c69e6fc68d3c6ddba8a9ce4f3a1a70f6e32dd32535513c004d4"
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
