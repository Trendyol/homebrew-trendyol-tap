# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CodePlayground < Formula
  desc "CodePlayground is a playground tool for go and rust language."
  homepage ""
  url "https://github.com/Trendyol/code-playground/archive/v1.0.1.tar.gz"
  sha256 "b1044489f9f9b8608956a0a4f19f1fc2fc47ad95c983a3d36832c9816663c8ec"

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
