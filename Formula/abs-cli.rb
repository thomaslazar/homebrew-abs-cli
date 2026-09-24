class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "1.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.3/abs-cli-osx-arm64"
      sha256 "e861b9183c77821654b62bb6b8ac302dcd80056222754269912f3350a3576b18"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.3/abs-cli-osx-x64"
      sha256 "e99e7a6f37881daaba096271a6f32d88208df4734b6257bff64b72dfe8a658d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.3/abs-cli-linux-arm64"
      sha256 "2dbd556e2dd9eb329d89376e99a81080be5c484430729639136a6a6dbfd2e2ef"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v1.1.3/abs-cli-linux-x64"
      sha256 "3f7f49fdfd2225db93c0b0cc9021f2ffa7aaef830cb02d270c9bcb581cef0550"
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
