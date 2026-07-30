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
  version "1.0.0.545-SNAPSHOT"
  license "Apache-2.0"

  livecheck do
    skip "Rolling dev channel published from the `next` prerelease"
  end

  conflicts_with "stove", because: "both install a `stove` binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "7f05ddff0d164c3c24907e38335747f362c53cee0cba93ea0363645b7ccd4c4c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "cc143f9f4286ba331ab43f50e695055138cb4493aa9bd443ac32d71495d72377"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-linux-amd64.tar.gz"
      sha256 "b91bbc5b8876bc51fd62335e52ba629b1255bd3ef79bf020c36f1255a93e5feb"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
