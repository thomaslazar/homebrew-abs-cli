class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.5/abs-cli-osx-arm64"
      sha256 "e146024d7daa43a3bfc02b547aa1b3c6bb94f289a842dea41eabc65414585161"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.5/abs-cli-osx-x64"
      sha256 "0887a47505086b87842bd7a229b96bbd74908ddc856db36491985360ba6b600c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.5/abs-cli-linux-arm64"
      sha256 "c2e8957e523e9822f9e4573c3f0487c625173a3dd2a09a9ccc59a890b09eab08"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.5/abs-cli-linux-x64"
      sha256 "684fe376b04c3601b968968fad910d824a84e4a11a80bfce9c5a1fc30440f11e"
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
