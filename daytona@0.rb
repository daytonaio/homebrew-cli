class DaytonaAT0 < Formula
  desc "Daytona CLI 0.x line (installs as `daytona-v0`, alongside the `daytona` formula)"
  homepage "https://daytona.io"
  version "0.0.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-darwin-arm64"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-darwin-amd64"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-linux-amd64"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-linux-arm64"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  else
    odie "Unsupported OS/ARCH combination"
  end

  def install
    bin.install "daytona-v0-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}" => "daytona-v0"
  end

  test do
    system "#{bin}/daytona-v0", "version"
  end
end
