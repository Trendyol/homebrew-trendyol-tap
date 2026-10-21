# Homebrew formula for Stove Server.
# Managed by the stove-server-release workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove
class Stove < Formula
  desc "Local observability dashboard for Stove e2e test runs"
  homepage "https://github.com/Trendyol/stove"
  version "0.27.5"
  license "Apache-2.0"

  conflicts_with "stove-next", because: "both install a `stove` binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "a914a8100fa05f6f618596b8320c3fa4deb81135f100771834023a191908bacf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "3ca4d896922f38d996f011cb3b9f57be6c22bf94988f6649ddda6600476f9772"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-linux-amd64.tar.gz"
      sha256 "aba799cc1c54ce000feaff17a664650d88afa88bffc9e36bd449b42d48df20c2"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
