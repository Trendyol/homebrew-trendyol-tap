require "language/go"

# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Gaos < Formula
  desc "HTTP mocking to test API services for chaos scenarios"
  homepage "https://github.com/Trendyol/gaos"
  url "https://github.com/Trendyol/gaos/releases/download/v0.1.0/gaos_0.1.0_Darwin_x86_64.tar.gz"
  sha256 "9944a9bca12321dbeec5aadb392c286e4feb6ba07bc4b4dfccd19fd3d9aa4f19"
  license ""

  def install
    bin.install "gaos"
  end

  test do
    system "true"
  end
end
