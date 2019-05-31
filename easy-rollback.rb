# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage "https://github.com/Trendyol/easy-rollback"
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.4.tar.gz"
  sha256 "1981801c0ff55ffc7ad21fbbaee5883a9bb77088d6eace9796ddd9fe61a9124d"
  # depends_on "cmake" => :build

  depends_on "go" => :build

  def install
       system "gobuild.sh"
       bin.install ".gobuild/bin/easy-rollback" => "easy-rollback"
     end

     test do
       system "#{bin}/easy-rollback", "--help"
     end
end
