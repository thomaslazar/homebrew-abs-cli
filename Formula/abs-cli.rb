class AbsCli < Formula
  desc "Command-line interface for Audiobookshelf"
  homepage "https://github.com/thomaslazar/abs-cli"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.7/abs-cli-osx-arm64"
      sha256 "2df01bab096baef131274ecce52291b6c655123e116d9978796d037c7605d5f1"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.7/abs-cli-osx-x64"
      sha256 "765552a326c2d81ced0cc704901b238a73c19df5325508e30ee35c5ab7d09c59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.7/abs-cli-linux-arm64"
      sha256 "4dfc198d2900d9d507c4aa53c1efdb38c5e887daf581304c4e6532be25aababe"
    else
      url "https://github.com/thomaslazar/abs-cli/releases/download/v0.2.7/abs-cli-linux-x64"
      sha256 "78d74d8bf8e9c11f3e5f3712f50a3ac99ebc5d37c833617c7043f92479bf4b89"
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
