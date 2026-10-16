class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.225.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "11122f532b390663b9f4bb72e4587cd9fb662dc996f00f0881b14da9ba525a07"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "f0753ab7f340ef9d74da12adf1520dacb020868b6958a11daa757193665880dd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "63e8e4798fb5783dd6a2997becc5bebf5a29cf48330cdbdd8fcdb83d6b3056fc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "f62ffe3a252a267bd03444b3dca7b0f8736693feee3bfc6831d11f9322844c69"
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
