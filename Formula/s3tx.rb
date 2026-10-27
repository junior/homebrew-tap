class S3tx < Formula
  desc "Move files through a private S3 bucket with short-lived presigned URLs"
  homepage "https://github.com/junior/s3tx"
  url "https://github.com/junior/s3tx/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "a3de1334446d6dac5b304070e08d1d7f35200d09cad863cc1251ce4fdeab4839"
  license "MIT"

  # s3tx is a single PEP 723 script: uv provides Python and boto3 on its first run.
  depends_on "uv"

  def install
    bin.install "s3tx"
    # The least-privilege IAM policy that the one-time AWS setup in the README uses.
    pkgshare.install "iam-policy.json"
  end

  test do
    ENV["UV_CACHE_DIR"] = testpath/"uv-cache"
    assert_equal "s3tx #{version}", shell_output("#{bin}/s3tx --version").strip
    assert_match "usage: s3tx", shell_output("#{bin}/s3tx help")
    assert_path_exists pkgshare/"iam-policy.json"
  end
end
