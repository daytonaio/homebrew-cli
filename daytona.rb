class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.16.2"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "e3b564756a86090cd893d3daff18b0a3065aa5498015d24d75cb0cc4d1cd2a10"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "5f556c26cf26eb369aa98ce3693e111a35d1c5f308fee551e01fbc8358b94506"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "890be39c2257b46f07135b7d7ab5b7c68d5c5c0bb6b61850839502aff75fbad6"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "9d366d9e16914eed509d18cc147c734cf1ae63ab039fc757af63ec51e1759410"
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