class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.232.0"
  conflicts_with "daytona-alpha", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "eae888861bea6dcdbf302459a0e48f4014f3f7bb9f807379d67abbebf79e87c7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "c4d93cb8debe0f34182e452174d953f34af70a3104947b85f995b3a172d2fca5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "ae8d8c2d68cf88a362e2edd9dcbf93cb09b4883250e327c668b0d88a878d41c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "95c003752d295081174a6bbc048e15ff8ae524e389e9162180f5ea482f6aa724"
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
