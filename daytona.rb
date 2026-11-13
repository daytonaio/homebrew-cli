class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "2.0.0"
  conflicts_with "daytona-alpha", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "70d4f669d7608da7b7ac3c9a3e542e516e4e9ea5d01b781897978a5da760b7eb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "bfc0b7e1181e1d78502be86ddb381795576f3a6d5b29238b4b531ffae21db712"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "a4720ae2a8602c87f54e4a8229d2fa1b1953035ad2e13e4363435b10242469c7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "03088341e44865860e3281385a00621a92628110e57b0760a82b33dd26e6cbea"
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
