class Regctl < Formula
  desc "Docker/OCI registry client — inspect, copy, and manage images (regclient)"
  homepage "https://github.com/regclient/regclient"
  version "0.11.5"
  license "Apache-2.0"

  # Upstream's own homebrew tap is an empty stub and homebrew-core has no formula,
  # so we ship the official release binary (arm64 mac — this is a personal tap).
  url "https://github.com/regclient/regclient/releases/download/v#{version}/regctl-darwin-arm64"
  sha256 "f4d536d64d0c3cc1db7400902175a1c314675991d22e87e15c319501a2676d3f"

  def install
    bin.install "regctl-darwin-arm64" => "regctl"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/regctl version")
  end
end
