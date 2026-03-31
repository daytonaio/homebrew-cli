class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.159.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "37f02f0579f2812e2dc21edd6962aa0de1cc794033181b6a73289a69d81919f8"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "53264c84498a830c43056f21724efc2d55267b270610061c14a29680626614cf"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "c2aaa914c75bd1340ddf4e13b880ed8bad76e75842c6e3c73f60af65330fecce"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "62da90a8ed630e25488e22943d190ca3951e86aaa2d14b4b23e9639c56ba6a10"
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
