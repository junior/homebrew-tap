class Skilla < Formula
  desc "Install agent skills (agentskills.io) from git repos — plain bash, no Node"
  homepage "https://junior.github.io/skilla"
  url "https://github.com/junior/skilla/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "22a41b64b9c9a00c40a27725c7b5001b48b7b1214caa833fa715594c67c1d2df"
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
