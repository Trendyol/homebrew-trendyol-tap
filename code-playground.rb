# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CodePlayground < Formula
  desc "CodePlayground is a playground tool for go and rust language."
  homepage "https://github.com/Trendyol/code-playground/"
  url "https://github.com/Trendyol/code-playground/releases/download/v1.3.1/code-playground_1.3.1_Darwin_x86_64.tar.gz"
  sha256 "768995f8a9633b15d332a5edb50c308e0edb086f699b925d06315eb9c0800c52"

  def install
    bin.install "code-playground"
  end

  test do
    system "#{bin}/code-playground", "--help"
  end
end
