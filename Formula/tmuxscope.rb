class Tmuxscope < Formula
  desc "Keep one tmux session per scope and repair the ones that drift"
  homepage "https://github.com/fayez-nazzal/tmuxscope"
  version "0.2.0"
  license "MIT"
  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/tmuxscope/releases/download/v0.2.0/tmuxscope-arm64.tar.gz"
      sha256 "f3857611e58cda763e7d1d6f7e3e88c6450bbe0a5bdbe4be83de22271bc59c33"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/tmuxscope/releases/download/v0.2.0/tmuxscope-x64.tar.gz"
      sha256 "7a8ca679e3ee9e36b8c033e250cf3d8d4d9d3fac1cca93fe9db9b5458cf32508"
    end
  end

  def install
    bin.install "tmuxscope"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmuxscope --version")
  end
end
