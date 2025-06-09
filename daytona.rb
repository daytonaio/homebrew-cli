class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.15.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "d44724b1b232e2e98daa13ccab5ddfade1295d842bb62c43de129d880f8fc7ed"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "69a0a7f6b69c7e780c63577b3536198b00cb76e4b982ba2b8a65804f3835df73"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "3ebf336e06e913c98ee3019e8612b3b1395e22f7d1936caa148473fc1932f8e1"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "8e9dc670f12d5b9e0916d802d7f5e65179a5f8a28f53c90d054de9bdb8d49360"
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