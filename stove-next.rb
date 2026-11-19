# Homebrew formula for the Stove Server dev channel.
# Managed by the stove-server-next workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove-next
#
# Binaries come from the rolling `next` prerelease on this tap repo (kept
# here so the main repo's release list stays purely `v*`), published
# alongside every Maven snapshot. Note: the formula cannot be named
# `stove@next` — Homebrew only maps `@` to a loadable class name when a
# digit follows it.
class StoveNext < Formula
  desc "Local observability dashboard for Stove e2e test runs (dev channel)"
  homepage "https://github.com/Trendyol/stove"
  version "1.0.0.582-SNAPSHOT"
  license "Apache-2.0"

  livecheck do
    skip "Rolling dev channel published from the `next` prerelease"
  end

  conflicts_with "stove", because: "both install a `stove` binary"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-arm64.tar.gz"
    sha256 "cc0c22c730e896aa541a34fe8756a5a73aa3badda0565edd3d0fedbd72af899b"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-linux-amd64.tar.gz"
      sha256 "362ef18115161817e427bbaf02d2146a202e4b416bd1542dda04978e6f016f99"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
