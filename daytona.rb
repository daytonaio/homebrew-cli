class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.124.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "18f6d0a6e881ee32a3516045a7bf0dbe33a106b5497cf7411b044f7bbbb649b5"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "b913b1508dd35a1b9a7d3a2bbbd5feeea8c78abb409c4261056fcd5ae39cc549"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "3590bcb90a75c32ba8b10d692d26838caedbc267a57db23931694abc9598c873"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "a1c75753eed039599e144016100b5713d760515613ff7321d029112bcec01927"
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
