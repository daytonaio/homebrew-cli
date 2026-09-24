class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.216.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "5df743bc08c5a1c1421e167e308ef99c2c3991972173595d931d3b73f4fd5c43"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "d55f3e5ac84e8908e162e5b220af4611f113fa9d7b78a51085baea694d2d3e60"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "9d6e924ae8f76cc0316c5ce3e7b529ecde79b40067298aca801f1cb068450890"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "06163cf58804358a48d588c789b68f20ba1086ff90c1a494d8b70055ec3e887f"
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
