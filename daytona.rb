class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.133.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "2a538079e4672182c7233deb53531657896ae8af956146e59b09b408f7c12897"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "81952c9f8ddb2a66654037bfa2db344c1b58d6b2662c68f07194aa20daba5acc"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "90edfa7d571159107a388bc6fe846135b6fe65748537c6ba7fa4291ab0efd5ed"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "bcd81e67e1f8eb55a4bcd48a88d90d4e62e4b541063091752f1dd8c32269aed3"
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
