class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.0/abs-cli-osx-arm64"
      sha256 "6de737c23e0b40ed0fbd4d6c9932dd4d962e0d3d54e5008c55b35e0c7133e122"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.0/abs-cli-osx-x64"
      sha256 "c0048db6f4176e56ed3cd145471274b06f25737657e33d9c7474acf62a51eb3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.0/abs-cli-linux-arm64"
      sha256 "fa8b51798bb02bc5fcd400ded1eb70047f34b2a51ec4d099fc1fd42f3f5d32c1"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.0/abs-cli-linux-x64"
      sha256 "d4f7fec1dc9cab8ee70761da21933a7613b209f088dded9556450583ac2f992d"
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
