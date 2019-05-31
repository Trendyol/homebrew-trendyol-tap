# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage "https://github.com/Trendyol/easy-rollback"
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.3.tar.gz"
  sha256 "c9d80a653352e70dc9ac2cb19b1312c7a9aa4c54e10133f9c515199e95548466"
  depends_on "go" => :build

  def install
       system "gobuild.sh"
       bin.install ".gobuild/bin/easy-rollback" => "easy-rollback"
     end

     test do
       system "#{bin}/easy-rollback", "--help"
     end
end
