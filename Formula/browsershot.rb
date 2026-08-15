class Browsershot < Formula
  desc "Capture a web page to a PNG or GIF as reviewable evidence"
  homepage "https://github.com/fayez-nazzal/browsershot"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/browsershot/releases/download/v1.1.0/browsershot-arm64.tar.gz"
      sha256 "44144933ca76106072a20fdd815f8cdd5e156dbfb6ee92fadbbda2f3e9718273"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/browsershot/releases/download/v1.1.0/browsershot-x64.tar.gz"
      sha256 "9ebc504ef99ab22d5434c17a2756b01e78262bf699075d596d02758dc825e284"
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
