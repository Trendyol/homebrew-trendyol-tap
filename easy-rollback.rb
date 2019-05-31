# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage ""
  url "https://github.com/Trendyol/easy-rollback/archive/v1.0.0.tar.gz"
  sha256 "10ce33aa1e15e4439b6a12430810b3dc49a6b05eeec1766160e5018bdef2ffac"
  depends_on "go" => :build

    def install
      system "gobuild.sh"
      bin.install ".gobuild/bin/easy-rollback" => "easy-rollback"
    end

    test do
      system "#{bin}/easy-rollback", "--help"
    end
end
