# Homebrew formula for Stove CLI.
# Managed by the stove-cli-release workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove
class Stove < Formula
  desc "Local observability dashboard for Stove e2e test runs"
  homepage "https://github.com/Trendyol/stove"
  version "0.26.0"
  license "Apache-2.0"

  conflicts_with "stove-next", because: "both install a `stove` binary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "e8345e4ddfbce6852569b413273850f645abc23a15caeb4b2dede469cf6cd2ad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "a313f2bbf9d84f5b335087440488519d770b3ee00a4f27fa13548a546ca23e9e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-linux-amd64.tar.gz"
      sha256 "cf34dd09b9e9e5abd6ad472924e18b659b6c2f8ed7c447086b65e775be10c83d"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
