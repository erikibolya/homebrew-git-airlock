class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.3/airlock-darwin-arm64.tar.gz"
      sha256 "ff21bdaec525bc728484e274f7c8b3c441b2335e15a4ba13f066a8a2b0ccdf2e"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.3/airlock-darwin-amd64.tar.gz"
      sha256 "6ac88291e49d297f571fd5bc41be4a0543c7745b51814baf385203dc54363a5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.3/airlock-linux-arm64.tar.gz"
      sha256 "2a7381842b798399f7b7c8a784a9293c6b91399ca70f51bc8fe2dc1fb3b288c0"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.3/airlock-linux-amd64.tar.gz"
      sha256 "3cbba5e608efb75ccb07ea9be7abf5cd1d673c8e7d469247e24c4a3931ecb1d6"
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
