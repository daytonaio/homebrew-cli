class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.153.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "a9d2f710f9fc652be441ca75b1e23b3e24773e150cbb0b4e43c2bf537e51de87"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "ccebe579b2a43ac2c945ebe55ed41a952850a1c9bb7316a81bdec89e6c62304b"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "78fb39da787bd0ce77dd0b6445b0259d84f7d58f37bb2c3cf975ee0db0f64d96"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "2676c0fa02865c3cff493a3d7c8a6c57ae49cd72fd5301bd52dca062b9a598a1"
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
