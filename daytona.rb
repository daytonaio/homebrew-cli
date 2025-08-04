class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.16.11"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "b87f4141bb675ea4abf91c135fcd47ebd88d36f7da45fdd51bab4b28c9af0f0b"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "79baf28dba6fdc30dd8325f555164e8070a570685f76fd9b23d3df3255225ce0"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "2a1fc60209f3ac6fb034fe6b5f8a3a31a73c7cde2503b74f2e5c6df87617f36b"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "b4a62a779b1e22c5594d44b2725f6b9dbd69138d19db68627ae846f9d288027c"
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