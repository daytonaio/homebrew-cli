class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.223.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "60a3cf46164f449fc87e6157dba60d78bef152d2f5b1dcc5d3ec96d938e1b4f4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "fc6b1f0c3143a06f6bf227a9149f55245b00c9fb6d28159b2453e664c165d5f1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "3c34c2345bd56e086db916fa29bb04fe1eacdd375e11e5805f33c6a63a5ca235"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "d7854c616c8fdd194cbb55289f3946fbe58cbc38dd1036553b274b12986ab8ee"
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
