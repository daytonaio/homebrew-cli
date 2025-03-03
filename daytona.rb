class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.13.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "ed05439559b186ceba902e2162772c0e5a74b18694e02b0dd8de67a9d8829cfc"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "ed05439559b186ceba902e2162772c0e5a74b18694e02b0dd8de67a9d8829cfc"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "ed05439559b186ceba902e2162772c0e5a74b18694e02b0dd8de67a9d8829cfc"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "ed05439559b186ceba902e2162772c0e5a74b18694e02b0dd8de67a9d8829cfc"
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