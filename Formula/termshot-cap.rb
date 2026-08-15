class TermshotCap < Formula
  desc "Run a command in a fresh window and capture it to a PNG with a JSON record"
  homepage "https://github.com/fayez-nazzal/termshot"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/termshot/releases/download/v0.6.0/termshot-arm64.tar.gz"
      sha256 "f4991e675e1d86bf8230f6608fba899c3fe6dbd52b7b3b8430dd581d6101fe2f"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/termshot/releases/download/v0.6.0/termshot-x64.tar.gz"
      sha256 "fdf2ce7d6165d942609740ab9653ea13676c7a3677e9fa4eefb2c8316f821278"
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
