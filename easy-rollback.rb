# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage ""
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.6.tar.gz"
  sha256 "84895e3ca020f72cdf482cdb4cd1670abdf9d70d7ace1d9770fbd88ba6d72c72"
  depends_on "go" => :build

  def install
       system "gobuild.sh"
       bin.install ".gobuild/bin/easy-rollback" => "easy-rollback"
     end

     test do
       system "#{bin}/easy-rollback", "--help"
     end
end
