class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.116.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "43cc5e74d2414347c59c9b2cb3355080fc40e79a8600a46759a73677ccf23ac1"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "015371c1349cd54adfba69dc7063d64686a289c7b622b084a970ac030c237f38"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "554e795a532aeef2da6dad4a18e543a45c2be1fc1a92581453268e7177ceb1e3"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "2c76e225d80fa368de252f7dcd483559b4be82e55620a81d0d47e0aa63ba5b04"
    else
      odie "Unsupported OS/ARCH combination"
    end
  
    def install
      bin.install "daytona-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}" => "daytona"
    end
  
    test do
      system "#{bin}/daytona", "version"
    end
  end
