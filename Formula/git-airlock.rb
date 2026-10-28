class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.0/airlock-darwin-arm64.tar.gz"
      sha256 "2913988a15d5f149aea6107f2c2fd48ef87ca42a32ae141faad710e25c1b170c"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.0/airlock-darwin-amd64.tar.gz"
      sha256 "6e132aba543773b31e4037e747790da8eb95db58e0031acb41257295971068b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.0/airlock-linux-arm64.tar.gz"
      sha256 "f05d1c9e72cb66b8ff653fc42f565a70e16696a2787a5863cc07986023c476a4"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.0/airlock-linux-amd64.tar.gz"
      sha256 "729996fad3e4929d487a63461da5dc3ad2c9be8133eade14e0299e4517c0ce93"
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
