class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.128.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "04b7fcbb116fcb3f9e2e17505606ff09ffd20b9439723ded7c4e07df94f39063"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "f2e8a84f95698812aa2cc5b4a650f6ce04efb048bd86355e18096804fa981a4d"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "f65639c37ca153184bfa7d4333b9af2f1c53d0e47d99103b0d46dc4e3ef9315c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "956fbb48155bc84c0e151d75ef6def82f56122c6c86613f5dc9af7fe9a830c5b"
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
