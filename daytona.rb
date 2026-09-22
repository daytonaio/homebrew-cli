class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.216.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "2693f44953f5757806a9d10d9aba030238190cece3cfdf379c3af406bde4b83d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "ec2c1446caead88b58d9a599fdcb91c751cd7c1ba6b6d8dac04eee4c74c7e891"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "2991d5da6dc06869e9af30ee612df8c23a9612ff93c1a6f165fd4503e71f68f9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "bc96acf40f1b72cd7d0f4d3e5aa5f500f304668504c73b6408086c762d7d3d78"
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
