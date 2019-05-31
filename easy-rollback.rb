# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage "https://github.com/Trendyol/easy-rollback"
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.5.tar.gz"
  sha256 "fb2924cee260ab750b450603fb5f1f042604604fa91f00f0e1795f18e05d8a8c"
  depends_on "go" => :build

  def install
       system "gobuild.sh"
       bin.install ".gobuild/bin/easy-rollback" => "easy-rollback"
     end

     test do
       system "#{bin}/easy-rollback", "--help"
     end
end
