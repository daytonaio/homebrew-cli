class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.15.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "d89b54c1f00a040d88705d1f91e9d39a83e9e4c052119302e2169587826a1d26"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "a444f873a486615119f105c2f3714f6f723d59bf572250a60f345f00f68efe40"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "c619c99cb54a5f7671f9a4119287519b4394d41e4c123049aa04d61ff80a3f63"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "6c0fd5d79a8b8f304b15abd37fbb9147c43178f82858362aee6f3bbe1e2b3959"
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