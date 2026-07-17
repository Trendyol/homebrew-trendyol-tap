# Homebrew formula for the Stove CLI dev channel.
# Managed by the stove-cli-next workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove-next
#
# Binaries come from the rolling `next` prerelease, published alongside every
# Maven snapshot. Note: the formula cannot be named `stove@next` — Homebrew
# only maps `@` to a loadable class name when a digit follows it.
class StoveNext < Formula
  desc "Local observability dashboard for Stove e2e test runs (dev channel)"
  homepage "https://github.com/Trendyol/stove"
  version "1.0.0.543-SNAPSHOT"
  license "Apache-2.0"

  livecheck do
    skip "Rolling dev channel published from the `next` prerelease"
  end

  conflicts_with "stove", because: "both install a `stove` binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/stove/releases/download/next/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "e2e2a69fbda114df5f7da705c3d0ca94f9c0ef9d0ce9f178d8f77073be568dc0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/next/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "45cc8347fa5c46fc5e8be4a8ddfc296376edf80c36f2a5cb570352986e1dcca6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/next/stove-#{version}-linux-amd64.tar.gz"
      sha256 "2babba3a0135687bd19dbe4208a1bd33f92c6df1b4e4d91bf5e42749cf8a2297"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
