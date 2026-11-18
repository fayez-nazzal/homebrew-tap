require "json"

class TermshotCap < Formula
  desc "Capture a command in a headless terminal as a PNG with a JSON record"
  homepage "https://github.com/fayez-nazzal/termshot"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fayez-nazzal/termshot/releases/download/v0.7.0/termshot-arm64.tar.gz"
      sha256 "9afec4ce051a2128dac3454c6f2be191107608e1e99c491439df36baa7379f43"
    end
    on_intel do
      url "https://github.com/fayez-nazzal/termshot/releases/download/v0.7.0/termshot-x64.tar.gz"
      sha256 "375a18e46931ff3049f54b8ff54c32f07cca307621f593c6fa087ee267d15e8b"
    end
  end

  conflicts_with "termshot", because: "both install a termshot binary"

  def install
    bin.install "termshot"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/termshot --version").strip
    result = JSON.parse(shell_output("#{bin}/termshot --run 'echo hello' -o #{testpath}/capture.png"))
    assert_equal "ok", result.fetch("status")
    assert_equal 0, result.fetch("command").fetch("exitStatus")
    assert_path_exists testpath/"capture.png"
  end
end
