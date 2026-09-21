class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.1/abs-cli-osx-arm64"
      sha256 "a9eb13ae91097e48ce5daca285a80b40e9b29cc7727f23378ec4c8721e4131a4"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.1/abs-cli-osx-x64"
      sha256 "a7cf5022963b0a8f54469320607311b931da4c57b04ddabaf8ec7a24aaadde00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.1/abs-cli-linux-arm64"
      sha256 "8ea0d9cd963e5b1bc3874ad5177e3d691693d744dc687f2d2f5962a34aa4d5e6"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.1/abs-cli-linux-x64"
      sha256 "9df36760c1ee3254c123361238edfd7bd2e745252903ee365aaa76245cb4a21a"
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
