class DaytonaAlpha < Formula
  desc "Daytona CLI (alpha channel — the V2 platform CLI; installs as `daytona`)"
  homepage "https://daytona.io"
  version "2.0.0-alpha.11"
  conflicts_with "daytona", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "d3ab2ecf2c2414a0ff706bdafa27f3dd298f1ac6023737335bd2d5efeb1298a8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "e17c30dbb43903ab62f334b3b7c53d9dd13bf921f487e2430c6a104d17735abf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "a3439f598c62313a2ce61bf84184d71c72a1eb9218f83e72309ec97150234eb6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "a6ce9a45b02b83d89cfc992b89bff6fdec446a9f77c0058dec8359c0f202f877"
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
