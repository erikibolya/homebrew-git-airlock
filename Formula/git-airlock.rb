class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.6/airlock-darwin-arm64.tar.gz"
      sha256 "54c1fd3742f91467d273705fcf123896caa6f5c2c2bc073858b3087f0dde79f7"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.6/airlock-darwin-amd64.tar.gz"
      sha256 "4f25f011ae7bef9a8d69e2e3fbca6b39fa6f45274ee513a337ddc07d016747ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.6/airlock-linux-arm64.tar.gz"
      sha256 "4a1fe8e60298bbbef69a89722b91cc27152c682d642b51a492733e1e7f95bc35"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.6/airlock-linux-amd64.tar.gz"
      sha256 "0bb8becc88e1a7fdfd3520751dc34ce88b69e96cf249ffdbb5a547ca9328a113"
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
