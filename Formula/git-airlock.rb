class GitAirlock < Formula
  desc "Push and merge pull requests across a network air gap"
  homepage "https://github.com/erikibolya/git-airlock"
  version "1.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.7/airlock-darwin-arm64.tar.gz"
      sha256 "e2a05ef6fb35ab3424102779417f0a62e2ab3d2e2a8eb54f7849bfbe5731d982"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.7/airlock-darwin-amd64.tar.gz"
      sha256 "9dbdab63bbba79a9c89c0e63460fb3ea213d003247a8e3de2a5202a2ca71c18f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.7/airlock-linux-arm64.tar.gz"
      sha256 "35a09d86933e2ed759d3ef42a28963b84d4be84db8bc9754b68c08b6e873a37f"
    else
      url "https://github.com/erikibolya/git-airlock/releases/download/v1.8.7/airlock-linux-amd64.tar.gz"
      sha256 "4446b0744efc8c022141cf811bb6ee1c27b02423231bb93359b7214ea05c537b"
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
