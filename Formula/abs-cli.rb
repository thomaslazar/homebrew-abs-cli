class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.2/abs-cli-osx-arm64"
      sha256 "18423fb579601ef8cf046369a56e750106284fc7961f262c82914d095c08ab2f"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.2/abs-cli-osx-x64"
      sha256 "bd759acf3260186bc0c2dc604c6acd482ecf5ab6b726589f84eeb4b438307775"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.2/abs-cli-linux-arm64"
      sha256 "f1431e977db16bff7838a67276cbc877db363d506beb4c9f80ab44f69c5f955c"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.2.2/abs-cli-linux-x64"
      sha256 "6a183a79a239da0a09f853d081704fc6553d3820843650857f13d68c797c4a9c"
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
