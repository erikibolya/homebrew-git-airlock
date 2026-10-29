class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.2/airlock-darwin-arm64.tar.gz"
      sha256 "80580ce4410eaa77bd2e98d82f9744ec244722bbf51a18687f76f958658e9dad"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.2/airlock-darwin-amd64.tar.gz"
      sha256 "6e7d1e88a573fa55573e70a88db634c9e000168203be1ea9290eea4ae778a5b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.2/airlock-linux-arm64.tar.gz"
      sha256 "217479c1834f08540095543f46065d050a81a7e8c859ced858f297181e904760"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.2/airlock-linux-amd64.tar.gz"
      sha256 "5cb87fce3ac29d28bf6b8bf931a5febd60c916e190ca77b0780d71c047d482a1"
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
