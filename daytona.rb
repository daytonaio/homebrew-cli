class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.207.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "1b18cb2a4a10b2f44dfd35986c28871e2f00015ae689824d65c38128208f3f5f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "e295f31be18245c91818d2ea7e2f5a9fd4e4de9698682c77fb6d818a5928090e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "94dac407c1692ef537252ddccb0e129cfcaccc023fae1f08696e55d9d8a5c06b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "8d46218e4319df52c0a9dd5e481bd04a04045f7c2d29ec04fced3a90221ee4e6"
  else
    odie "Unsupported OS/ARCH combination"
  end

  def install
    bin.install "daytona-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}" => "daytona"
  end

  test do
    system "#{bin}/daytona", "version"
  end
end
