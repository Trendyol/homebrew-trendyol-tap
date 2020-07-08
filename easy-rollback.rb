# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage ""
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.15.tar.gz"
  sha256 "f750cd8d519522fafde1a81a8e7d265b3c5f47446f5d3d506779411761c736ea"
  license ""
  depends_on "go" => :build

   def install
     ENV["GOPATH"] = buildpath

     bin_path = buildpath/"src/github.com/Trendyol/easy-rollback"
     # Copy all files from their current location (GOPATH root)
     # to $GOPATH/src/github.com/kevinburke/hostsfile
     bin_path.install Dir["*"]
     cd bin_path do
       # Install the compiled binary into Homebrew's `bin` - a pre-existing
       # global variable
       system "go", "build", "-o", bin/"easy-rollback", "."
     end
   end

   test do
         system "#{bin}/easy-rollback", "--help"
       end
  end
