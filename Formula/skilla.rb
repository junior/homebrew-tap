class Skilla < Formula
  desc "Install agent skills (agentskills.io) from git repos — plain bash, no Node"
  homepage "https://junior.github.io/skilla"
  url "https://github.com/junior/skilla/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "7b8e983ad97d96dc6e57800846a1d96fe24160f17d089ca7f5017c7db7f75345"
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
