class Tmuxscope < Formula
  desc "Keep one tmux session per scope and repair the ones that drift"
  homepage "https://github.com/fayez-nazzal/tmuxscope"
  version "0.2.1"
  license "MIT"
  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/tmuxscope/releases/download/v0.2.1/tmuxscope-arm64.tar.gz"
      sha256 "e7c7d2f7f3e65db691a52c56e6b7662363f96c9d5f682f0c4fe740fb35833095"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/tmuxscope/releases/download/v0.2.1/tmuxscope-x64.tar.gz"
      sha256 "b9537fee4cf992995ceb3994da7735a8e47c8367e2fac4c882bb112c3feb56e2"
    end
  end

  def install
    bin.install "tmuxscope"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmuxscope --version")
  end
end
