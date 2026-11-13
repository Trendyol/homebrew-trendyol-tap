# Homebrew formula for Stove Server.
# Managed by the stove-server-release workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove
class Stove < Formula
  desc "Local observability dashboard for Stove e2e test runs"
  homepage "https://github.com/Trendyol/stove"
  version "0.28.0"
  license "Apache-2.0"

  conflicts_with "stove-next", because: "both install a `stove` binary"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-arm64.tar.gz"
    sha256 "4281dc6e4edf08d3a250f1813d4108875594a4cbcb5e4124ca3bd0d9df8c016d"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-linux-amd64.tar.gz"
      sha256 "0e2e963397cf6320dc1a65cb848c77dc27036343788f7215d3d98c3755f342aa"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
