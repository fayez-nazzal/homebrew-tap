class Contrastshot < Formula
  desc "Measure true WCAG contrast over gradients and images by pixel diff"
  homepage "https://github.com/fayez-nazzal/contrastshot"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/contrastshot/releases/download/v0.2.0/contrastshot-arm64.tar.gz"
      sha256 "21525f9aabb63aad425609e7c4c8a36af907c0faac7d804ccc5ec5b3f1b027d4"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/contrastshot/releases/download/v0.2.0/contrastshot-x64.tar.gz"
      sha256 "0d3ed46019c73b8488b23f9ad0ef018160069518ac2b1befaf5226c1ced17929"
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
