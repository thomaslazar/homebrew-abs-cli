class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.3/abs-cli-osx-arm64"
      sha256 "449db94fb92ed5a01800e64f567ee7ae34fd5f1b09ab79a148b423bb33fc3243"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.3/abs-cli-osx-x64"
      sha256 "05420fba3845c388af271e2e87a08410217715df453cbeb467985b82d1f0062c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.3/abs-cli-linux-arm64"
      sha256 "d0be2fe9ded615c803fc7de17c104c9bef987a7e17fc338bf6f9ddb169db9cdb"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.3/abs-cli-linux-x64"
      sha256 "568af1b0c337305c74129254f411100aa2b518f67217dbfd553cafba69a83c15"
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
