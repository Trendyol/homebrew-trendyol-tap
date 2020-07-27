# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Verg < Formula
  desc "verG is a semantic versioning CLI"
  homepage "https://github.com/Trendyol/verg/"
  url "https://github.com/Trendyol/verg/releases/download/v0.5.0/verg_0.5.0_Darwin_x86_64.tar.gz"
  sha256 "5782ce43e66175786aef9c5903a8a57bb105db98d5b5a722331560fc4c9f4b70"

  def install
    bin.install "code-playground"
  end
  
  test do
    system "verg", "--help"
  end
end
