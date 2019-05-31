# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage ""
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.2.tar.gz"
  sha256 "6ecd737a6f1bd8d5c0fc77f85fcd8a852e8cdecf40f2f290625518332651fa2a"
  depends_on "go" => :build

  def install
       system "gobuild.sh"
       bin.install ".gobuild/bin/easy-rollback" => "easy-rollback"
     end

     test do
       system "#{bin}/easy-rollback", "--help"
     end
end
~
~
~
-- INSERT --
