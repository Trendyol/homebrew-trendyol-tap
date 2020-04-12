# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Verg < Formula
  desc "verG is a semantic versioning CLI"
  homepage "https://github.com/Trendyol/verg/"
  url "https://github.com/Trendyol/verg/archive/v0.3.0.tar.gz"
  sha256 "f93082f9692b25423754bfb5cc95b0a0371814aa3c339afe968f0c593caab5bd"

  def install    
    bin_path = "github.com/Trendyol/verg"

    cd bin_path do
      system "cp", "./verg", bin/"verg"
    end
  end

  test do
    system "verg", "--help"
  end
end
