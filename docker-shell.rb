require "language/go"

# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DockerShell < Formula
  desc "A simple interactive prompt for docker"
  homepage "https://github.com/Trendyol/docker-shell"
  url "https://github.com/Trendyol/docker-shell/archive/v1.1.0.tar.gz"
  sha256 "8993cb15e854b2fe97bd6193e42d6d33ab56531e6ef82fe70f174574362c1c82"
  head "https://github.com/Trendyol/docker-shell"

  depends_on "go" => :build

  def install

    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/Trendyol/docker-shell"
    bin_path.install Dir["*"]

    cd bin_path do
      system "go", "build", "-o", bin/"docker-shell", "."
    end
  end

  test do
    system "true"
  end
end