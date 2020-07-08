# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage ""
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.16.tar.gz"
  sha256 "18b56225565431299b93a8770ddbcfd28b9ad28254145ac4ae74fd0e26b736f1"
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
