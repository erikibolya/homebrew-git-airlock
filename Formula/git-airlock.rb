class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.1/airlock-darwin-arm64.tar.gz"
      sha256 "b5a708d0bc8ed663ad1b3f5755f37a2928f6081f91b10f7d30a57137cc556686"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.1/airlock-darwin-amd64.tar.gz"
      sha256 "eb09697f559506b9205df2d2911522728b8f0cdde6bafaef5b3558ac351151ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.1/airlock-linux-arm64.tar.gz"
      sha256 "364e8015719d94af8175ad94e7db2af48bb9894acce2c1b205dcfcfb6cc656df"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.1/airlock-linux-amd64.tar.gz"
      sha256 "0215d4ff9785e7fd514944814962801b7c669c6c3e264ae090907dc9d54b4f41"
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
