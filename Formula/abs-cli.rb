class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.3.0/abs-cli-osx-arm64"
      sha256 "aa293e7148dc3555de12668937a067847c07f9436f8810b8f97d749c97d99faa"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.3.0/abs-cli-osx-x64"
      sha256 "6401584beaf3d60fc65d2cfc507e9905ef091f386e4fc245d0f21f6969a84fda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.3.0/abs-cli-linux-arm64"
      sha256 "84debc30cfabdecdba86d1bb080276cc74591aec91e840ca6a2e062af54ef462"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.3.0/abs-cli-linux-x64"
      sha256 "7a64fbd26d5768d88ca62b0b396c332f509ff900e9bd6c31ae881468cc3ef716"
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
