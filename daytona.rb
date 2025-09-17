class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.102.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "9b08ced727f9c8832e5f689b3678aeeb47578d43873098b66a460729abd3c4da"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "1512a4cb61b1e518fbfecb8a06f30eb1d948e510e6c7376c0c5bbc6494829eaa"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "bf6a0c77a8b54ae764df8cd2fb88a65fac301ba0687f6a7f05523951973e0278"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "8f07bbe60e246a0a417d68f1c3457d1193f5580096c0eca7ebb30a508e5276f3"
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
