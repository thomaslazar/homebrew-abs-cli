class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.0/abs-cli-osx-arm64"
      sha256 "43312e9f22ee7906ddd6d22b52b36481e12fb3ae3bc97122f701135485f66119"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.0/abs-cli-osx-x64"
      sha256 "a50ff2d0de3ab774a2c519a3127cfe55de54048acec1afc06a0b2fccdbbf6c19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.0/abs-cli-linux-arm64"
      sha256 "88de4cc29af56730684d28dabb9ece8345224d42ae71fb70aafee17aa348db65"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.0/abs-cli-linux-x64"
      sha256 "e98a9ade4fd7aa4bf485e50dc6167d276586894c63c563f3c5ed27b325e9822f"
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
