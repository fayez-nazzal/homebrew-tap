class TermshotCap < Formula
  desc "Run a command in a fresh window and capture it to a PNG with a JSON record"
  homepage "https://github.com/fayez-nazzal/termshot"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/termshot/releases/download/v0.6.1/termshot-arm64.tar.gz"
      sha256 "2c6e9dbbca2f851ab5c919d758905e19bc4724e57fd367f6df29f438cb70c368"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/termshot/releases/download/v0.6.1/termshot-x64.tar.gz"
      sha256 "235514c3e84a79261645658064b3062f2606352d0e03706301a81234e2fe374b"
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
