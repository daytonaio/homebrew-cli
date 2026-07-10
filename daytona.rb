class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.196.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "9b74759a2e789a53490f1e29fb3df8997991723a4e1f31705a8b12110c1420cb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "5e46863712fcdf749088d86c72b45a0c9e000901184cc30b2bed46598b196348"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "43bbc4b7b84b954c0ad0f5a9837c9f31a09df317d88bb1a671e4895bec1bcb22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "3f912379128679f6816fe72c6394d7208c2f06a97b0a344bc31e667ec81b0984"
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
