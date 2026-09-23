class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.216.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "3dcb6b37016bea378ad9b9659aa3ef715affabe52bd34cd2cf5be778951f836b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "5a0c0d9a0f5ef2c6436a4eac5fce6639f2187b202867c3e7169a245bb7ab62ad"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "8ee3a1f8bd5ef307b906cbb48a6888673a3a2221854e11f2cbbf9785e7fc2385"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "b61c4ffa95523da1cf6b5f7e5e6ee03fe2150e6ea21e96ee4f9cbf8befa3d991"
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
