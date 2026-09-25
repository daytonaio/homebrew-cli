class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.218.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "d9f9c3978e252359b6c8c6d8dbf1517ce952327c2224602468386d9e1e56482f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "36a1fc39700493724ba5ca30fd2db3caf660f0ec78bc9bd2a5b231dd37965dfd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "58db79c1c57016c831a6398d3579d1faf37557112914b825d329e04ed6edd318"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "4bef2d7d99535ca151e256bbda47e6affcf6e25ea71e51f683585c0d59bb163c"
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
