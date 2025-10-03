class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.108.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "ebb725fccbe5c7e9f5486a2cd6b4e1dd0d8661e1936082ba16d3532c48902a9c"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "8580a2f59ea9eb2034cb4a2eb3207f9e47fae262256ab2a3f25f1b3fc28839da"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "b68dcedc9844ef0cf2c5ef7b8a02c701797e045016b3328d105331c6c0c5dc89"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "86e1ead321b436aaa91a60ebf095e20f8b0442f56f7ab56c5ced38d8dec47b6b"
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
