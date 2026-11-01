class Kcx < Formula
  desc "Kubeconfig file per cluster: contexts, namespaces, profiles, a read-only shell"
  homepage "https://github.com/junior/kcx"
  url "https://github.com/junior/kcx/archive/refs/tags/v2.2.3.tar.gz"
  sha256 "8b73a2f1b723e0fa60cd44debc109f783910e824b79a9f09fa8ca4adbd8aecc7"
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
