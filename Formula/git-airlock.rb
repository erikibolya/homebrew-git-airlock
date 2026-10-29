class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.0/airlock-darwin-arm64.tar.gz"
      sha256 "e6876e0cc12630ed6c5ba10aff2f370f503ee3c29a64da364ad40580a6b2e3ad"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.0/airlock-darwin-amd64.tar.gz"
      sha256 "b19489fae550134652bf6a01ae324c112e17beeeaaa797fff274e3e0805983e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.0/airlock-linux-arm64.tar.gz"
      sha256 "d11076e34d2d78b31b0c6d492eb1d8cac7549b2d810791cba3de97fe62cf7f91"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.0/airlock-linux-amd64.tar.gz"
      sha256 "04f2382779a21bc6275354454c9b022223f4701cb6ec3b5f3185df743ec0dc95"
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
