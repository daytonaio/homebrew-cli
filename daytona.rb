class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.13.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "bf0f8438a3a2093925d2b652d0f751aa22fe2f1d15cece4529201e030ad25f77"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "9d7d4fb419d7f5ae88c313f9d62319c6996ad0a12df641a626d921a850240be3"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "858e07ea04ab36797a3f86a9bc68492a695462e246e74952cfc121fd1b066c05"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "e18f57b0fad36c2f381c9a10802a6d0a5ed5d33f529ff5a97920f1e5a8c448e2"
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