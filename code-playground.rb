# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CodePlayground < Formula
  desc "CodePlayground is a playground tool for go and rust language"
  homepage "https://github.com/Trendyol/code-playground/"
  url "https://github.com/Trendyol/code-playground/archive/v1.0.0.tar.gz"
  sha256 "2ccd7992b817fd44f2abe3bc44af04af7b77f1314d756ca3e5866b1acf34b3c4"

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
    system "true"
  end
end
