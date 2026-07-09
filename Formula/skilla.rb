class Skilla < Formula
  desc "Install agent skills (agentskills.io) from git repos — plain bash, no Node"
  homepage "https://junior.github.io/skilla"
  url "https://github.com/junior/skilla/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "50a75c6a2940764e096dfcafc25fb52808bb6576c6daac49987f87a73d0e3a82"
  license "MIT"

  depends_on "jq"

  def install
    bin.install "skilla"
    # Ship the bundled agentskills.io skill that teaches AI CLIs to use skilla.
    pkgshare.install "skills"
  end

  test do
    assert_match "skilla #{version}", shell_output("#{bin}/skilla --version")
    assert_match "Usage: skilla", shell_output("#{bin}/skilla help")
  end
end
