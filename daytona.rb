class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.184.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "21c0ae8dcf6ffef8dbf91bdc5fca649c0391b3b62da9c0931fe57e23f436bbb3"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "4ab8b5af55a6e8d5c83008110cc1c844696de712b3a62b6041a8ba811fb10e19"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "a170f4996b35b83622f58d98c21cb0d1c4ae3454ac62b1ec1351178a7e0489d6"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "8c3df2dea5189129e12e900887d978bb5abe2b53c4051e2615a2a0ce4a35241d"
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
