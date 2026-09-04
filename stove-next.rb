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
  version "1.0.0.557-SNAPSHOT"
  license "Apache-2.0"

  livecheck do
    skip "Rolling dev channel published from the `next` prerelease"
  end

  conflicts_with "stove", because: "both install a `stove` binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "f86bea18d1b0a9c74fc18389abe169c007702c2d615cbfa79c4c9173a1c9d1dd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "69bb65c6b8793a1ae8a1c3dc5903ebc38addb5bc857c88adc441f47d421aed00"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-linux-amd64.tar.gz"
      sha256 "237e117cadc4fd543f2bf47f9ce42d79b49a2cbf3c2e04c67960f9b7101e3310"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
