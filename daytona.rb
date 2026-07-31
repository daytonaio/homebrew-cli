class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.203.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "5f6f6fc8668419064df5b35bd7b482ac895fdf39ad32068998a4e12bb718da47"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "99cca006837cf51b0c0e66a41b2f0b122d5780d73ffa0e089aa69312e3d9ad6e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "e6bf8ad4e805730d41175b0d2707656dcd2b1805594b2d7a784882bd0fd7f032"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "6d06b82a95378187f69bdfba0a51b5aa209ae56f8c8d7fd78220afe7d6f5a6d0"
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
