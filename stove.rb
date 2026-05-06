# Homebrew formula for Stove CLI.
# Managed by the stove-cli-release workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove
class Stove < Formula
  desc "Local observability dashboard for Stove e2e test runs"
  homepage "https://github.com/Trendyol/stove"
  version "0.24.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "4c824c04c39d945579943160158d51b2a96d46486b31602915fe17739c3d201b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "1acf5d414c94b313189a4c63b1166e10cd5ee63083665fb63ac8f00fecb88996"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-linux-amd64.tar.gz"
      sha256 "43b6f689bf017b96f287fff3401600cb3dc5c5daf0c4515a702f0f0686fcfdb5"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
