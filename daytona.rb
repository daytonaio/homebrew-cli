class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.128.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "4dcdf91061c1c56b0a3ceab5863915d43829f9ddee31087511f1f3d0843125d6"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "b41315364981f0144a15eeb554b4a498b346d2bf0fa68cf999c0387f7da06064"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "169f29b6954eb3223676646f78d454b37bfd75230f3a917dd5974ce6678dc935"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "eb5fa97c5653dc97c78af157c1cec704cb23a423496584b1b09f11879ac3eb21"
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
