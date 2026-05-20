class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.5.0/abs-cli-osx-arm64"
      sha256 "c9f39a43f2f4b3a170a13f1e385707328a4e3430cab276bb9fc675c4d2270fc3"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.5.0/abs-cli-osx-x64"
      sha256 "94d25c1cc7bf407923df3d0c69483a7546b6ce077c002938e541ceeb517cb5bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.5.0/abs-cli-linux-arm64"
      sha256 "a2b94e922e3f1771ef76b1034ebc561a19c87b2b7f8af01035a59d901f4a1724"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.5.0/abs-cli-linux-x64"
      sha256 "7fb33f0faf8b388a428f4c19510b1de1dd6659ab4961e0fef4a5790ce35eb0eb"
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
