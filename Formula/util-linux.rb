# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class UtilLinux < Formula
  desc "util-linux is a random collection of Linux utilities"
  homepage "https://git.kernel.org/cgit/utils/util-linux/util-linux.git"
  url "https://www.kernel.org/pub/linux/utils/util-linux/v2.28/util-linux-2.28.tar.xz"
  version "2.28"
  sha256 "395847e2a18a2c317170f238892751e73a57104565344f8644090c8b091014bb"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--disable-libuuid",
                          "--disable-libblkid",
                          "--disable-libmount",
                          "--disable-libsmartcols",
                          "--disable-libfdisk",
                          "--disable-mount",
                          "--disable-fsck",
                          "--disable-agetty",
                          "--disable-cal",
                          "--disable-logger",
                          "--disable-ipcrm",
                          "--disable-ipcs",
                          "--disable-kill",
                          "--disable-last",
                          "--disable-login",
                          "--disable-nologin",
                          "--disable-sulogin",
                          "--disable-su",
                          "--disable-runuser",
                          "--disable-ul",
                          "--disable-more",
                          "--disable-wall",
                          "--disable-bash-completion",
                          "--disable-utmpdump"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test util-linux`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
