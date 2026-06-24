class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.190.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "65b66d912110bb192d6a0ff4eaf722a20456923869d5b5ff64bb46229bed43a6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "39fb4495d25c469989b807c902093dbad47dba951dfd4650aeac3b4f18a10e70"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "1d3591a1ea61d801696110e1b5f3381f223a56a623a882940d0d85742862fd44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "783a801c27f5412bfe1c0ef915cddde8faecbb4ee79b4e97de9615f280c52994"
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
