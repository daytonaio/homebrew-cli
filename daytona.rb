class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.14.6"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "837894b81819cf3ea2cc1169ee5b32dd4895001c382769bbca7d01a907e751b1"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "b1b8b99d0c15eb33f23dc2be4b6fef7725ff98b160ca7d84b89e5dea9d27af74"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "aa994d98e5a0116db5f3dc92fca80037f8b59e803ffa0c022812a2c04fbb3030"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "c5e0f2f6b26ddc3360e16a519bc0138c249d891062eb144ebfef8584ce9a079e"
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