class Skilla < Formula
  desc "Install Agent Skills and Agent Plugins from git repos — bash, no Node"
  homepage "https://junior.github.io/skilla"
  url "https://github.com/junior/skilla/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "1e38aa06082f4ba03324b7ceaea36cd42995f81cbbabb8f24beb9f29998d0a39"
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

    # Agent Plugins 1.0.0: scaffold a manifest and check it validates.
    (testpath/"my-plugin").mkpath
    system bin/"skilla", "plugin", "init", testpath/"my-plugin"
    assert_match "agent-plugins.org/schemas/1.0.0/plugin.schema.json",
                 (testpath/"my-plugin/plugin.json").read
    assert_match "conformant Agent Plugin",
                 shell_output("#{bin}/skilla plugin validate #{testpath}/my-plugin")
  end
end
