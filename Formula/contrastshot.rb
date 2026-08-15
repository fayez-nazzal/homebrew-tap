class Contrastshot < Formula
  desc "Measure true WCAG contrast over gradients and images by pixel diff"
  homepage "https://github.com/fayez-nazzal/contrastshot"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/contrastshot/releases/download/v0.2.1/contrastshot-arm64.tar.gz"
      sha256 "b14fba6378c56fec423fbfe50af3f0ab6160e9bad9044701dc1b63c8a589adf6"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/contrastshot/releases/download/v0.2.1/contrastshot-x64.tar.gz"
      sha256 "5f8cda5ffd744f3e77de1c927d867fed82179c68a6eea7c3854fc6205af00f89"
    end
  end

  def install
    bin.install "contrastshot"
  end

  def caveats
    <<~EOS
      Chromium is not bundled. Install it once with:
        bunx playwright install chromium
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/contrastshot --help")
  end
end
