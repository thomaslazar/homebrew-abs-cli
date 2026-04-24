class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.6/abs-cli-osx-arm64"
      sha256 "ec6cfeeb337f5ff3c12bd33c6926a8dcee8dddaa6061e23b2a837c866e7be51a"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.6/abs-cli-osx-x64"
      sha256 "d2cdfc189da592b74fe22926772265292991672daef8172e74b17240da7b3eaa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.6/abs-cli-linux-arm64"
      sha256 "14c7ee0e270d35102702911c472e2749a876e9aed56bdc55c3c48c3bb69ff051"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.6/abs-cli-linux-x64"
      sha256 "7e7fab13e9d700236ec8efaa1cd48f33b6bd9dc8889534e9fb01edf830ea3449"
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
