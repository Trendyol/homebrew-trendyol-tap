# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CodePlayground < Formula
  desc "CodePlayground is a playground tool for go and rust language."
  homepage "https://github.com/Trendyol/code-playground/"
  url "https://github.com/Trendyol/code-playground/archive/v1.2.1.tar.gz"
  sha256 "85fcf4206b733e2e9734b3c9c7b713bdbd3b31eeaf47257e29b43774cf57b839"

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
