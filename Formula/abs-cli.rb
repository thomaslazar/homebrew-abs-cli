class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.6.1/abs-cli-osx-arm64"
      sha256 "f0430691e31df81072fe199fd5792d724e31342a19e4f4fb1af02a1d3b26ac0b"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.6.1/abs-cli-osx-x64"
      sha256 "98201b3f3cffc122146fadeada6253341fe527e9905aa810806f550fc69c35f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.6.1/abs-cli-linux-arm64"
      sha256 "c5e53baa8bdae74c615ec06566cad55037916764d9d6737154ae3693dbe00b38"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.6.1/abs-cli-linux-x64"
      sha256 "14e2197d347a117875a738b7f847a6c6c9e74688c33ba20c47e9af6b09c14e35"
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
