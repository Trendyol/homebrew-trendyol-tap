# Homebrew formula for Stove Server.
# Managed by the stove-server-release workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove
class Stove < Formula
  desc "Local observability dashboard for Stove e2e test runs"
  homepage "https://github.com/Trendyol/stove"
  version "0.27.4"
  license "Apache-2.0"

  conflicts_with "stove-next", because: "both install a `stove` binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "4dba1f01e28d4aba178c3c227c2e28e684673c5b504745141e28279556e9670b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "b2c5f80eb1bb28cd26e05f4e3e9928d870c029c210925fe3d4116322382a4e4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-linux-amd64.tar.gz"
      sha256 "5b4afa3080f3493f8ea50fd5e1425b6128873c9d1e98a97eb910872b6d77fc9f"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
