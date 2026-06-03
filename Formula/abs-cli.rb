class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.6.0/abs-cli-osx-arm64"
      sha256 "8c51164b56ea6cfcf12f63e34d59a7bbd8ec91463eb5a838f09f0b76f406b77c"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.6.0/abs-cli-osx-x64"
      sha256 "dd493dde4d4ff0b8cd1a34c1e6073d5e8f7fe902ad6e20bc8838237050e1af87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.6.0/abs-cli-linux-arm64"
      sha256 "ef2185191585b80dd536eff609e1a0419cc24ef9a524a42fe8686f280d33e79a"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.6.0/abs-cli-linux-x64"
      sha256 "14e69e0c3da9503ecaed94b6a9cbf1198880a81368de556b942b68097b5c995e"
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
