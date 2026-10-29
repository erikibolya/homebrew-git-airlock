class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.1/airlock-darwin-arm64.tar.gz"
      sha256 "c27fcfd5dff2c57702301292d03c8e79701925fd62aa27f5ca1912886077f539"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.1/airlock-darwin-amd64.tar.gz"
      sha256 "943bf72add1093b260ae38b195ee4a6984f6132b32c1cd58a9f80d77692e3bd0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.1/airlock-linux-arm64.tar.gz"
      sha256 "0d6d012e12e5c29aee675d1c78aa56d41c982593ef1d84f717be8b93f705c294"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.1/airlock-linux-amd64.tar.gz"
      sha256 "a47280bb621296904f23c0248024de9240261472445751f7682eba49f1c0438f"
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
