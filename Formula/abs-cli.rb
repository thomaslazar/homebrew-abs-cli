class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.4/abs-cli-osx-arm64"
      sha256 "641df529cf05540345ba245e968d7dcdab5d720b22b330b67c7c91d038f7a626"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.4/abs-cli-osx-x64"
      sha256 "dfb17c6c2b819228270d9411bd9b73ebb28613ba79e639160fb5927f6359250e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.4/abs-cli-linux-arm64"
      sha256 "5334f49e0c1f91c2ba25c4b54b1b841052b216f48238877f30f3dd531d27fda8"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.4/abs-cli-linux-x64"
      sha256 "e081c76b8741b3ae31f76020cb1e9d4d5ed6b845af9c4a5709575f4025165094"
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
