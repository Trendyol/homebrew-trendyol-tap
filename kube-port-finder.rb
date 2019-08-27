# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class KubePortFinder < Formula
  desc "kube-pf is a command line tool that find available ports on kubernetes"
  homepage ""
  url "https://github.com/Trendyol/kube-port-finder/archive/v0.0.2.tar.gz"
  sha256 "42ec30ede8989588bb8af2af4adda753d6505e192de0940bee8d60a97401546c"
  depends_on "go" => :build
  def install
      ENV["GOPATH"] = buildpath
      bin_path = buildpath/"src/github.com/Trendyol/kube-port-finder"
      # Copy all files from their current location (GOPATH root)
      # to $GOPATH/src/github.com/kevinburke/hostsfile
      bin_path.install Dir["*"]
      cd bin_path do
          # Install the compiled binary into Homebrew's `bin` - a pre-existing
          # global variable
          system "go", "build", "-o", bin/"kube-pf", "."
      end
  end
  test do
  system "#{bin}/kube-pf", "--help"
end
end
