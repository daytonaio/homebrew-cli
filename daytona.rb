class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.125.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "736834ebdf21c64d46702c2eeec5d61572e4b41c863964c71671b612327604f1"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "4d8cc9da039ac2822b0bb41416849130ec99cd71f22b4735dff751ab0b5036c7"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "ad6ff602aead0d4d97dc1f1ae61f965783a8125443ca4a0f8b602f8719f8922f"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "edd19ae32274d9be6dcb377b68791a7ddb08e946c8c96b5880766a0e83068bd9"
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
