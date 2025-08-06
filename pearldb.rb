class Pearldb < Formula
  desc "Lightweight pure Perl SQL-like database"
  homepage "https://github.com/Desantonio/pearldb"
  url "https://github.com/Desantonio/pearldb/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5c66690657ab2ae608d71ec1de4ad12a6fe7d0be760649916e6b8d59a7d9e2cb"
  license "MIT"

  depends_on "perl"

  def install
    bin.install "pearldb"
    libexec.install "lib" # ← installs all your .pm modules
    # Patch the script to include lib path
    inreplace bin/"pearldb", /^use strict;/, "use lib \"#{libexec}/lib\";\nuse strict;"
  end
end
