require 'formula'

class Grep <Formula
  url 'ftp://ftp.ring.gr.jp/pub/GNU/grep/grep-2.8.tar.gz'
  version '2.8'
  homepage 'http://www.gnu.org/software/grep/grep.html'
  md5 'cb2dfc502c5afc7a4a6e5f6cefd6850e'

  depends_on 'libiconv'
  depends_on 'pcre'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug"

    system "make install"
  end
end
