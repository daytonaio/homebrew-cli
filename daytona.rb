class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.224.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "a90ede4e99e17e22f41256247f11ab972c1b6cf1d387f0de53c224d1c510824d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "ce031e3c1ee82cdfdb31dd17dca363de910a712f4a9e33a43afdd947d05597ca"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "ace35bcd5030f95b4215728aabd73a230158c1db768fa0225b3b682434733f9d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "19868364a106d1b66b7747fa9782f3ea0b962e62122d257832e72190fca5aa63"
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
