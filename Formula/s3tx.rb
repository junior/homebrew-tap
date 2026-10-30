class S3tx < Formula
  desc "Move files through a private S3 bucket with short-lived presigned URLs"
  homepage "https://github.com/junior/s3tx"
  url "https://github.com/junior/s3tx/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "9d427c3b17026e04c174515021d2173e1e49252f4ec108c0fd6d3e6dc6f124aa"
  license "MIT"

  # s3tx is a single PEP 723 script: uv provides Python and boto3 on its first run.
  depends_on "uv"

  def install
    bin.install "s3tx"
    # The least-privilege IAM policy that the one-time AWS setup in the README uses.
    pkgshare.install "iam-policy.json"
    zsh_completion.install "completions/_s3tx"
  end

  test do
    ENV["UV_CACHE_DIR"] = testpath/"uv-cache"
    assert_equal "s3tx #{version}", shell_output("#{bin}/s3tx --version").strip
    assert_match "usage: s3tx", shell_output("#{bin}/s3tx help")
    assert_path_exists pkgshare/"iam-policy.json"
    assert_path_exists zsh_completion/"_s3tx"
  end
end
