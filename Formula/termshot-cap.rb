class TermshotCap < Formula
  desc "Run a command in a fresh window and capture it to a PNG with a JSON record"
  homepage "https://github.com/fayez-nazzal/termshot"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/termshot/releases/download/v0.5.2/termshot-arm64.tar.gz"
      sha256 "440dc60851bca605a33a66cb404b549c6229d3195b02b4fe41670c6cd06b6ad3"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/termshot/releases/download/v0.5.2/termshot-x64.tar.gz"
      sha256 "112531906daecac6a871d177b92cb2434446480f6f935ab570017084121b638f"
    end
  end

  conflicts_with "termshot", because: "both install a termshot binary"

  def install
    bin.install "termshot"
  end

  def caveats
    <<~EOS
      termshot needs Ghostty, because every capture runs in a Ghostty window:
        brew install --cask ghostty
      Grant Screen Recording permission to your terminal under
      System Settings then Privacy and Security.
      --publish needs rclone.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/termshot --version")
  end
end
