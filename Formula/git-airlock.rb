class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.4/airlock-darwin-arm64.tar.gz"
      sha256 "59f8caf622b21791f14e0b2774d990475fabb2732022a647ad079b920ba98b68"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.4/airlock-darwin-amd64.tar.gz"
      sha256 "1b80e358ba1a5044a153b5544f5bf56ae687d76cee916d6a51a22513305eb782"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.4/airlock-linux-arm64.tar.gz"
      sha256 "e3c5101a982c21cc2cdf0b13f226a04d1415f483d21283cab72a39564aa55cf9"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.4/airlock-linux-amd64.tar.gz"
      sha256 "68a76e5944e4fed6fdfd9bfae5f084fada64e0e01db55ae4a27988c35159d735"
    end
  end

  def install
    target = if OS.mac?
               Hardware::CPU.arm? ? "airlock-darwin-arm64" : "airlock-darwin-amd64"
             else
               Hardware::CPU.arm? ? "airlock-linux-arm64" : "airlock-linux-amd64"
             end
    bin.install target => "airlock"
  end

  test do
    assert_match "git-airlock", shell_output("#{bin}/airlock version")
  end
end
