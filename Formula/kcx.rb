class Kcx < Formula
  desc "Kubeconfig file per cluster: contexts, namespaces, profiles, a read-only shell"
  homepage "https://github.com/junior/kcx"
  url "https://github.com/junior/kcx/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "b6cf49dfb7ee5a6ce3fddfdd1a3d10c84eebf18ec5b210b3f0651eab06bc13fe"
  license "MIT"
  head "https://github.com/junior/kcx.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/kcx"
  end

  test do
    assert_equal "kcx #{version}", shell_output("#{bin}/kcx -v").strip
    assert_match "kcx NAME", shell_output("#{bin}/kcx -h")
  end
end
