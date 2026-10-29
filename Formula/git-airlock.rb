class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.2/airlock-darwin-arm64.tar.gz"
      sha256 "1193be1ba01d5d015b0703e185b440e3ce19e679e79eeaed6799be7e5b6017a7"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.2/airlock-darwin-amd64.tar.gz"
      sha256 "3b56483393e2f27ca364fbc6832d7d7d98776d222ac5f3c88e853a944b565ca3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.2/airlock-linux-arm64.tar.gz"
      sha256 "883d55275634331aea8f58809465051a683de841610239f10bc1a982fd7a3894"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.2/airlock-linux-amd64.tar.gz"
      sha256 "a5b63b884b4d7b0159de9324a747ac8461dd50919ff1ad0b2cedc4d35baf8fcd"
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
