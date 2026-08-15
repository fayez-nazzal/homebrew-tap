class Browsershot < Formula
  desc "Capture a web page to a PNG or GIF as reviewable evidence"
  homepage "https://github.com/fayez-nazzal/browsershot"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/browsershot/releases/download/v1.2.0/browsershot-arm64.tar.gz"
      sha256 "587926375c535709e4d5ef1144e8583dd118669bf368bda0d1fb6d6f9fbabdea"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/browsershot/releases/download/v1.2.0/browsershot-x64.tar.gz"
      sha256 "0bcc15e0606f3424fa19c93914072e5214294154bf214b7b4416ece894746de2"
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
