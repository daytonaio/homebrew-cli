class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.14.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "d3e6ea786013104cc3ee63e68d45a776b1af3cac3d66b47c650dfd0d9bf42238"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "9ad6954264b65bd7a5df10c3322660e09ff864ebec92a7c18a498424b5699773"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "161b83829e5a6cd088e77c7b64d403aa5b981a0dcc8f5d6fd49ce0f23b2378c6"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "4e8e49d57403cd20b345df21845a4eab3354458b2cc2ee3c144bbcccee9ddc91"
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