class Pearldb < Formula
  desc "A pure‑Perl SQL‑like database engine"
  homepage "https://github.com/Desantonio/pearldb"
  url "https://github.com/Desantonio/pearldb/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5c66690657ab2ae608d71ec1de4ad12a6fe7d0be760649916e6b8d59a7d9e2cb"
  license "MIT"

  depends_on "perl"

  def install
    bin.install "bin/pearldb"
    libexec.install "lib"
    # Add lib directory to PERL5LIB
    inreplace bin/"pearldb",
      /^use strict;/,
      "use lib \"\#{libexec}/lib\";\nuse strict;"
  end

  test do
    system "#{bin}/pearldb", "--version"
  end
end
