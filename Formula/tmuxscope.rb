class Tmuxscope < Formula
  desc "Keep one tmux session per scope and repair the ones that drift"
  homepage "https://github.com/fayez-nazzal/tmuxscope"
  version "0.1.1"
  license "MIT"
  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/tmuxscope/releases/download/v0.1.1/tmuxscope-arm64.tar.gz"
      sha256 "0a1d432a961ba75c844f9a1b80cf337de972afbd455716bd5dba9ee749d6e8cd"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/tmuxscope/releases/download/v0.1.1/tmuxscope-x64.tar.gz"
      sha256 "e8c59bff56d653122e6e8601696f3d1b3650ed787c88e89238d646c601fb388f"
    end
  end

  def install
    bin.install "tmuxscope"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmuxscope --version")
  end
end
