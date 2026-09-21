class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.2/abs-cli-osx-arm64"
      sha256 "f000251046b17a0d6990739c441a1f31b094fdf6154ad9776da6fba64ba8f9c1"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.2/abs-cli-osx-x64"
      sha256 "e276e1a93edad2685517a2a5bff14103bb8cdda565ffef79194f51ea393f1691"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.2/abs-cli-linux-arm64"
      sha256 "80c0df2ac2fbe36dad91a43b5be498580023ef5188c13b29022807e8a7de9c6e"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.2/abs-cli-linux-x64"
      sha256 "84ddd508a64f615a3213fd9b51b4072d18960c3063b880df02e53e6ea11f773f"
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
