class Browsershot < Formula
  desc "Capture a web page to a PNG or GIF as reviewable evidence"
  homepage "https://github.com/fayez-nazzal/browsershot"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/browsershot/releases/download/v1.1.1/browsershot-arm64.tar.gz"
      sha256 "c423d3ad3bdf80da967bfef42545b040fc8a24c8870bf441f1eb314d7118f183"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/browsershot/releases/download/v1.1.1/browsershot-x64.tar.gz"
      sha256 "59db1e9b90f8a63a533c8dd639f87f345cc009f86f6e73cbddc9634c72c1b1df"
    end
  end

  def install
    bin.install "browsershot"
  end

  def caveats
    <<~EOS
      Chromium is not bundled. Install it once with:
        bunx playwright install chromium
      Google Chrome is used first when it is present.
      --publish needs rclone. GIF assembly needs macOS.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/browsershot --help")
  end
end
