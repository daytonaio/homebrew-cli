class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.223.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "cc20e25cf15f3ea9db9eaaef48ca84dd57261b7ec5ce1675badfc48b7320da5d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "0d115704aa3110ffbc526d645d8c2512ea787a1610c3eab93630d4aace8ccbb5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "bb3f6986f810813aaa14b09a8961b67f5ea37621724dfcc93f0a1f3595b2a7e5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "f56661c620c4281ff47af40066a1f2c7c9c8c389e094e5e195498f537794b043"
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
