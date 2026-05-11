class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.4.0/abs-cli-osx-arm64"
      sha256 "c70372ed46c8aa144b3e3c491d32b8c8f135c2cc47bf9c488db0f78aae5bdfe9"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.4.0/abs-cli-osx-x64"
      sha256 "7f8b98875053c106cbef836668344f9c81b034c0252743447a7766ebf7d33f77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.4.0/abs-cli-linux-arm64"
      sha256 "3f0ff1daec539c7a0aea9395b289a4716a47a48072a13695593255e2d882601a"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.4.0/abs-cli-linux-x64"
      sha256 "f0aaea924becc951e58e95dfdc612ebdfc3c5e5665ed83778193bebbab23c13e"
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
