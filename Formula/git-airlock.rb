class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.4/airlock-darwin-arm64.tar.gz"
      sha256 "6d1cb90f2aeebadb5fecb4da9c515d089bdf728f7f814e558ef504d3e413fdd7"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.4/airlock-darwin-amd64.tar.gz"
      sha256 "cb138bacbe2ee213073533693a365d74b5b7188c4c65c123d259ad4837b59a67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.4/airlock-linux-arm64.tar.gz"
      sha256 "5d85b769596b93a424903c7f5222ba429d342d02eacb54aa9622786475bb6d15"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.7.4/airlock-linux-amd64.tar.gz"
      sha256 "4c1ea06566f24360b32e9b5f7d87336b5c00260435a6ea22ab793d72b1ed53c0"
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
