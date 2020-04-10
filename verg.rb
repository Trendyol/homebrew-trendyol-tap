# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Verg < Formula
  desc "verG is a semantic versioning CLI"
  homepage "https://github.com/Trendyol/verg/"
  url "https://github.com/Trendyol/verg/archive/v0.1.0.tar.gz"
  sha256 "0959bcafc72011c1532c8705ddd0f9461722311558c62f614e033890fd677ae6"

  depends_on "go" => :build

  def install

    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/Trendyol/verg"
    bin_path.install Dir["*"]

    cd bin_path do
      system "go", "build", "-o", bin/"verg", "."
    end
  end

  test do
    system "#{bin}/verg", "--help"
  end
end
