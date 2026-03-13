class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.151.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "10849322a0b96f5eeabf025ce57ee6faaac9790774e1b1b07c3dc2188d8edd9f"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "59198a937de0c7e172344166ccc809a763a52d86faf365d929e443dd7c869b51"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "12b519b2553a86ff7cd8cc2345b91a680fd978aa1d8c8267f64e74c0bd9dd789"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "4d8794d1b808463b2fff4eabea419c7807a57331e8bf480ab72cbc9418e421e9"
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
