class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.167.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "3791146e832e795f6dee34253fbf8779dcb41b2a23d5369454f8cfd846bd14f6"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "c286c0efa426f1c780b3aa374e477a536f2f896679f7429b9173eb7b164c081b"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "41f1183aeaf74b2e3fe6c3052c0b1845d3e002ab6a5200ad83a1124d96785fb9"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "adae16587abee1ecfb513e4eca9dc3cbcb692745395d9d3955fa4bed20bb4947"
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
