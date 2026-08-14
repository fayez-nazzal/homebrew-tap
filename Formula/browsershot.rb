class Browsershot < Formula
  desc "Capture a web page to a PNG or GIF as reviewable evidence"
  homepage "https://github.com/fayez-nazzal/browsershot"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/browsershot/releases/download/v1.0.0/browsershot-arm64.tar.gz"
      sha256 "ebaa5239ac3ff868a790b7054f116ca9860454316f55c402ae3734f22b92bf31"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/browsershot/releases/download/v1.0.0/browsershot-x64.tar.gz"
      sha256 "3cb70b6afb1502064e3b37af333a4fb95632a502e0759b2d0f69047be528cb1c"
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
