class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.16.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "d3f5332d5206dd920d8160840788f548a77de66ebf71ad73e4d23b5161a11875"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "132dfe5534847ac986a1165b2dfbbd00c23524d8cf80463503a5bc7a6e3cd817"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "72a17d28318f753c2b453bb1c07c04fee9f5fc360237d75d0bfab096e2ca9cfb"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "af6d55e44cd3002e5e7fa847b046279820a218967bb596a8d5be0d7b6b3dff25"
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