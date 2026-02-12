class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.142.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "916ed1e58c634c487eb838fe52167cb4f5ed602bb44067192190a2ddfed100e6"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "14d0262fee48b7d58798c0c7c496e6d49acb343fded7a07ba1e23cc46c19c8ad"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "0f1cb3edb1e1b149cb7ae54936cbf104d79656a644cf45d9c925ee40239c0afd"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "b27ce4538b351f30192a68843509d8a3f0ac434b4bd8d83a5657d5ffc38b7279"
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
