class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.2/airlock-darwin-arm64.tar.gz"
      sha256 "e6424b9049bdad66ef64888641fe1f2ba9c19cf4e5b4551d41391e16e667cb97"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.2/airlock-darwin-amd64.tar.gz"
      sha256 "d522634435b93ed0f9a8226fca7cba38102e13df7728427ddfddba965136ee3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.2/airlock-linux-arm64.tar.gz"
      sha256 "46c0df31d5a809bdabc55630a6c0548695759f5567d7292ef3b1a2b67681591e"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.6.2/airlock-linux-amd64.tar.gz"
      sha256 "2935290efe5105c5952e3d2527342cd39db08b0614ebdb8b9b2117d79820f7cc"
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
