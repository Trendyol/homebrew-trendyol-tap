# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EasyRollback < Formula
  desc ":recycle: Now you can easily rollback to previous deployed images whatever you want on k8s environment"
  homepage ""
  url "https://github.com/Trendyol/easy-rollback/releases/download/v1.0.16/easy-rollback_1.0.16_Darwin_x86_64.tar.gz"
  sha256 "2af6307b741d90b2dc16d49fdb7f3e5673089ccad6e9cd9576a4bc2b34a7fea0"
  license ""

  # depends_on "cmake" => :build

  def install
     bin.install "easy-rollback"
  end


  test do
    system "#{bin}/easy-rollback", "version"
  end
end
