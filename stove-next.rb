# Homebrew formula for the Stove CLI dev channel.
# Managed by the stove-cli-next workflow — do not edit checksums manually.
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
  version "1.0.0.546-SNAPSHOT"
  license "Apache-2.0"

  livecheck do
    skip "Rolling dev channel published from the `next` prerelease"
  end

  conflicts_with "stove", because: "both install a `stove` binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "972f0a539ec8a355e7fe03e9f0906171803ad9d1934125303f51474a1f5b28a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "551ea1be5992f1c26558156f48c4a40d6606d77142fc67108235b58ea30faf25"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-linux-amd64.tar.gz"
      sha256 "4dad473953c00c06ed33921ef5fbb18c7fa814af839746697419ef757b1eea95"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
