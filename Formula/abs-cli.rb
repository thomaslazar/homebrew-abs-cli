class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.2/abs-cli-osx-arm64"
      sha256 "126dc3ddc6271e2c878ee5d426ea61e3c0300d2396007acd6cebf83981a7a2bf"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.2/abs-cli-osx-x64"
      sha256 "53112081d32a5234745b0d03d18d2389e2ec60407b377e9908f0218c1eceec27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.2/abs-cli-linux-arm64"
      sha256 "5fa3cd280fe37f798a9df7242b54918949ce392fbec458e15b506b79fa6c2cc7"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.2/abs-cli-linux-x64"
      sha256 "ad2b29eddd9237103c76a4a06c70c3f7cf530854bc282120df8310f983bf3d45"
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
