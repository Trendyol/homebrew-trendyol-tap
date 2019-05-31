# Documentation: https://docs.brew.sh/Formula-Cookbook
# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage "https://github.com/Trendyol/easy-rollback"
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.1.tar.gz"
  sha256 "9b5ff3203569b133ab6e3789c340d9ef3212c41ee7f189e65937150fef12b1e6"
  # depends_on "cmake" => :build
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
~
~
~
~
~
~
-- INSERT --
