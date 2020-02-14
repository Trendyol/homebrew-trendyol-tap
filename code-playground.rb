# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CodePlayground < Formula
  desc "CodePlayground is a playground tool for go and rust language."
  homepage "https://github.com/Trendyol/code-playground/"
  url "https://github.com/Trendyol/code-playground/archive/v1.1.0.tar.gz"
  sha256 "53c41fa90cb5f31c540b63f73f6f991d2b6485d256622525c3a796bd721793ad"

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
