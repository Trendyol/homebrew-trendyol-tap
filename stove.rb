# Homebrew formula for Stove CLI.
# Managed by the portal-release workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove
class Stove < Formula
  desc "Local observability dashboard for Stove e2e test runs"
  homepage "https://github.com/Trendyol/stove"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "acb18ed9932921aff03e04f8812cbcddf40cd0f085227677d3b6c010a2cb3029"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "2048ae07875915e6228136e9f2e49bf4377a1a3a5fb6204cefd7c63c5a85b1a1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-linux-amd64.tar.gz"
      sha256 "e8f8eb2d3f050d118321bdf825f3777ec844b74a7f25112004bd124154a6b739"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
