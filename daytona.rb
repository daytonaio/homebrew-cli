class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.14.3"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "21de1bc41d7b4310e8d51782bb72d82203206ddf0020f8b8a562a917dc82febc"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "45e66a1a0960f314debb865bb52befee414655cbc9acaaf89cf086fbcad513e4"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "173c39145576df726a1a2a7e744b5f5b758669fa3d04eda687b66d89120b0c88"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "9c096d73a02b844dd48b127bd9d1944a43d935e7040223ba5c151abd0ffeb222"
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