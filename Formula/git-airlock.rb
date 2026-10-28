class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.1/airlock-darwin-arm64.tar.gz"
      sha256 "6c918ce4de05c540f3820822ee4d1795183b971fd9493877a793b14f22beb411"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.1/airlock-darwin-amd64.tar.gz"
      sha256 "fb758c5e03551b609bda730315b939e0794c5f392e0718080af423b17830ad1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.1/airlock-linux-arm64.tar.gz"
      sha256 "c4f8baee5013fc4e0012355b18905cf93b1cde2137313a52bd5d8c7104d57ffe"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.1/airlock-linux-amd64.tar.gz"
      sha256 "df515063e53363c5f09bad458f849a84b05fda0fe6def77ed38896b09a51d6ae"
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
