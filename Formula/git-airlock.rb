class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.3/airlock-darwin-arm64.tar.gz"
      sha256 "5d55a7f850e16cb222d0f697336819457e49f0c2c63a803c6833b9bc1d5e5e3b"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.3/airlock-darwin-amd64.tar.gz"
      sha256 "c40a505afa55e248afcc125960dcee40765fec86f362bdf1e139398227eedbb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.3/airlock-linux-arm64.tar.gz"
      sha256 "06da568f9f19f3d3aa4aa9e470616a15ce1a646b95d4b11b8be17e44fb530168"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.3/airlock-linux-amd64.tar.gz"
      sha256 "8b8413494745b69f7fc64840498d1ab1948bfbd34925b49bc4e7c750da7e4558"
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
