class Contrastshot < Formula
  desc "Measure true WCAG contrast over gradients and images by pixel diff"
  homepage "https://github.com/fayez-nazzal/contrastshot"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/contrastshot/releases/download/v0.1.1/contrastshot-arm64.tar.gz"
      sha256 "c0f04b088565302ad704d21281c3c9ed2412b2427da5adc93c0f0afac3c57c24"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/contrastshot/releases/download/v0.1.1/contrastshot-x64.tar.gz"
      sha256 "f7872e4e5dc63d84cb91004de84c7184a18c3f5488056f355afa3e56744c74c1"
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
