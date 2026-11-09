class DaytonaAT0 < Formula
  desc "Daytona CLI 0.x line (installs as `daytona-v0`, alongside the `daytona` formula)"
  homepage "https://daytona.io"
  version "0.231.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-darwin-arm64"
    sha256 "4ceb7fb6293b3035d2054db434f67a8db92df1b8359fb06f2139b1e47dd56a9d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-darwin-amd64"
    sha256 "745a6b1eb3f16d0be2a08b2faf7121c216759b5d05ef5d1095db03f5de68d1cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-linux-amd64"
    sha256 "e3bf4b5d0e47fffa0c0a50e100a86c12afd8957d9d93f659df73531c97bb5216"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-linux-arm64"
    sha256 "c60fe4acefd4051c8661237a6b1e833a4769304acbdabe3f5d7196b53f304596"
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
