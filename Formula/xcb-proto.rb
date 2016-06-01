class XcbProto < Formula
  desc "The xcb-proto package provides the XML-XCB protocol descriptions that libxcb uses to generate the majority of its code and API."
  homepage "https://xcb.freedesktop.org/"
  url "http://xcb.freedesktop.org/dist/xcb-proto-#{version}.tar.bz2"
  version "1.11"
  sha256 "b4aceee6502a0ce45fc39b33c541a2df4715d00b72e660ebe8c5bb444771e32e"

  # depends_on "cmake" => :build
  #depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test xcb-proto`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system true
  end
end
