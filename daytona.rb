class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.129.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "8f286ee1b7526ee5811a77be5875d1abeb84b62c538099c4f21c010c3132f822"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "ede76f5dff1033a09561c5e732c1f1300676acb8b492424bda97adf6c33053a4"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "f63e0e3502f3260e430a221a8dbfae40f2ee098ff43da3286c87b684a1fbdec5"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "7dffe34d83fe00e4578c4708e84b1bce0b5bd5cc9f3beabf314b3c612063a886"
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
