# Homebrew formula for Stove CLI.
# Managed by the portal-release workflow — do not edit checksums manually.
#
# Install:
#   brew install Trendyol/trendyol-tap/stove
class Stove < Formula
  desc "Local observability dashboard for Stove e2e test runs"
  homepage "https://github.com/Trendyol/stove"
  version "0.22.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-arm64.tar.gz"
      sha256 "6a981719c2773d0a8f2d536d163a53e45102bdd260b050e198f115730edd66e3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-darwin-amd64.tar.gz"
      sha256 "16b7bbb243a010c1ae46a9c2ba1053f1723ef31153e14b9b8e6f877280ef353b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Trendyol/stove/releases/download/v#{version}/stove-#{version}-linux-amd64.tar.gz"
      sha256 "a8c124e46b1e8d168c4932ffb03dea38460140cad12b937270dab72b79ec7920"
    end
  end

  def install
    bin.install "stove"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stove --version")
  end
end
