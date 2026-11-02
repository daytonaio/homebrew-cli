class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.227.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "90afc9f77470976b0ae2c733f070977ebb1ad3f651733242f1a964358e8afb88"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "4029e53683230768491ddd75df9fb99ef6cf3c2b7947be2d57636e78eeb4d222"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "a4abcc88baffb3e2b4aa0595977da662662fb750e68e44da1a0d0da1a75ddf0b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "3a8bbed846a119ba4e7de0d3fc05c37f47310a5abb808b11f0c8047a10b20710"
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
