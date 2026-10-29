class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.5/airlock-darwin-arm64.tar.gz"
      sha256 "2b5bd87412693c83c40d5e3eb21647c22292c5dc29a1bea12e8152d6d6080567"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.5/airlock-darwin-amd64.tar.gz"
      sha256 "697800a7482c68b0e8d521d82a487259f025a37d541b73ed5148d1dd81f2a64d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.5/airlock-linux-arm64.tar.gz"
      sha256 "a656de3fae1f1f70948c3ef4c212bfc3ae357c58e39c7ce0483a4cc32a85b9c5"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.5/airlock-linux-amd64.tar.gz"
      sha256 "157afeeb10c7b987c4a1bca1d545ed2694f614ad517bfaa6b0a992b56fbb4198"
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
