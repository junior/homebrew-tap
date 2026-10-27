class Kcx < Formula
  desc "Kubeconfig file per cluster: contexts, namespaces, profiles, a read-only shell"
  homepage "https://github.com/junior/kcx"
  url "https://github.com/junior/kcx/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "1bf99db56a85cfcaed529010ad27d8eca89bcacc657dff5e5876ace0179ab9db"
  license "MIT"
  head "https://github.com/junior/kcx.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/junior/kcx/internal/cli.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/kcx"
  end

  test do
    assert_equal "kcx #{version}", shell_output("#{bin}/kcx -v").strip
    assert_match "kcx NAME", shell_output("#{bin}/kcx -h")
  end
end
