# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CodePlayground < Formula
  desc "CodePlayground is a playground tool for go and rust language."
  homepage "https://github.com/Trendyol/code-playground/"
  url "https://github.com/Trendyol/code-playground/archive/v1.0.2.tar.gz"
  sha256 "2b7d7f900bfdd9f1ac1f0ed9904a8b34da23d56481cee79420a2bf8cd1ef3a35"

  depends_on "go" => :build

  def install

    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/Trendyol/code-playground"
    bin_path.install Dir["*"]

    cd bin_path do
      system "go", "build", "-o", bin/"code-playground", "."
    end
  end

  test do
    system "#{bin}/code-playground", "--help"
  end
end
