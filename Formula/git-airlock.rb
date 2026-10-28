class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.0/airlock-darwin-arm64.tar.gz"
      sha256 "2f3058c96f6a292bdf9e3675f7f3e8481392374f106186c112595ae4f7b8294e"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.0/airlock-darwin-amd64.tar.gz"
      sha256 "a7c6f7cb6e681bf26875d804ed6d5437d2ecf3a8183b8c42a4bcf2edbf8b5858"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.0/airlock-linux-arm64.tar.gz"
      sha256 "1662640bb44b9a5e0510f8689dc5faa699d56c61980de3fa1e3b63954c3aa6e2"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.0/airlock-linux-amd64.tar.gz"
      sha256 "567b9c789f1c57685719463714f5d06414214a0e39f20910f19b2e4ad56c7073"
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
