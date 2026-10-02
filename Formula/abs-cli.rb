class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.0/abs-cli-osx-arm64"
      sha256 "21862031973f78358e90090d850cfef26fb5e6f1ab0965a0b011afdf7f459725"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.0/abs-cli-osx-x64"
      sha256 "3e84d402503490f104cf9a172133cebef4f94c8c1611a7fbd98d8719461fbe58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.0/abs-cli-linux-arm64"
      sha256 "151e06a89619f0c5c58e1d7fb1c67de7caeba7d1602a686ea54a276c2d13c317"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.0/abs-cli-linux-x64"
      sha256 "7388f102bdb613cffbbc52c4bddba50db63a59422484bb1933289485869e58fa"
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
