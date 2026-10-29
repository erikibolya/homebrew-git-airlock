class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.3/airlock-darwin-arm64.tar.gz"
      sha256 "c14bc3445eafe046cbda24ce8319eb7c161244e0b8a40912a595d61b3eb88ee8"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.3/airlock-darwin-amd64.tar.gz"
      sha256 "9950e96efe933224426ffe93fef1d9d5dd30c9a1a552e1b8e8cb76d92b713d64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.3/airlock-linux-arm64.tar.gz"
      sha256 "0b052b886b0c77ac3d21d259cf209bb6b3b4872d550823fe5bd4c45102933a9b"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.3/airlock-linux-amd64.tar.gz"
      sha256 "cac52591486783d94c62282eb663fbf1092ad9dd61a2125a010505d575233b31"
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
