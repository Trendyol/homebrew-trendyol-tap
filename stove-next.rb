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
  version "1.0.0.552-SNAPSHOT"
  license "Apache-2.0"

  livecheck do
    skip "Rolling dev channel published from the `next` prerelease"
  end

  conflicts_with "stove", because: "both install a `stove` binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "5a3291f21e0743084bbf4e8e96bb87ae99b1c6a24d2568266d3e5de44db7a74e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "d872627d865b12824b9620939bc9d87d86aee4cce42f76ccea2ae9488c54fe28"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/homebrew-trendyol-tap/releases/download/next/stove-#{version}-linux-amd64.tar.gz"
      sha256 "f743f6a5e5496e1d527fbf2f26204af11ab6ef68f064c34556ce5621804e24ea"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
