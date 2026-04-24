class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.169.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "5d88c0d0ddf0460a407019919785dee27321caa2dfa7875fe70e4a65cb3e4c3c"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "5f65ba3b8483ea3ae57e3cb71b8d8266f4663d2288f3930561ff1fbd1d9d52be"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "ce1836bc3a40dcf0cdfde8643632f087afec9f790d7edaefb8962c0a9386e497"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "8c6950d570d51216167726abd3611b8d32c03a5b451a349fe3f7b5f05e50cbd3"
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
