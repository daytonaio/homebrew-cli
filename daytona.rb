class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.227.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "a23fa3f86fe01c3a7ae7bab65cddca69bb4633178661b959e8929c4f6373c7b2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "2b4df26f862f9f0ee9a8a418a501c904aebb51b5e84f82a7cf191143d7862120"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "9b96de541fa2cba56043698bc77f7754c122c2ceab05b6f957405a816449dbed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "3d5ac65341953280837b477591a05440e9bb003d43e3394cdc2ee942e34d5e86"
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
