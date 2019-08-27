# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class KubePortFinder < Formula
  desc "kube-pf is a command line tool that find available ports on kubernetes"
  homepage ""
  url "https://github.com/Trendyol/kube-port-finder/archive/v0.0.1.tar.gz"
  sha256 "02836e254299dcd7c974229cff1c668439195961d8cbc6ea6255ee567a3133f9"
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
