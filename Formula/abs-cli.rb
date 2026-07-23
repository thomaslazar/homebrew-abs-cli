class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.1/abs-cli-osx-arm64"
      sha256 "c37d2e077f813f4fb31f29b3a470acc156f9b32d05499919eb6ba00b4637b774"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.1/abs-cli-osx-x64"
      sha256 "9c87e6ba7b6ce2348b300dc39c3e814f48123e1045aee02cbdb3265eb830e93f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.1/abs-cli-linux-arm64"
      sha256 "e275a31031e94e5fec65d395125fd8c02aae85aad235accc83ac4ae4d3af0c73"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.0.1/abs-cli-linux-x64"
      sha256 "2e436ccf20e97a7ac7fc91c3bc79eff3bf3ecbc26182fd8e4ba95cd67679f604"
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
