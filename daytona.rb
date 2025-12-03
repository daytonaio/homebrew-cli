class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.121.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "f720c7dd19d02fefe39d0b94e73d937c8a4080677fb73cd1f7eee1567aa86c92"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "2792d0224aa38221a3b4757e7e67a11ea53a42ff5911f1b980a68806aec7ee43"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "0a18f1cbd8249b894e879a7dd6e528fe70da36cd57de28a4f869a6340df27d3f"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "8e980aa0084a55eae9fcedbb80a3cfdcd0b6e4d3dacad1688c9400d7bdac62e5"
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
