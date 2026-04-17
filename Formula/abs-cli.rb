class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.4/abs-cli-osx-arm64"
      sha256 "bdc1006c53d13ef2edcfbe9cda488a891c4a19ad340bcab0aa6e829e6901e791"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.4/abs-cli-osx-x64"
      sha256 "40de100dd30d704b538a9ba63d34f493d187f1baff392b0afb334610537e57fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.4/abs-cli-linux-arm64"
      sha256 "574223909173139994fb9658ef3b2636ba018cfbc78defab1d000a6d45ca832c"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.4/abs-cli-linux-x64"
      sha256 "8275ac44b44d6177f9d74db146687561fd0723960702f6d7ae18cbe2db32ddcc"
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
