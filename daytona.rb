class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.147.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "424c8bc7c4c58fe9a1a001d7090f46fdf0519476aeb946f39e4b62eaee551269"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "92b352dcea3d2a05ebbd3a4e41363e1dbf15aba8d944a553b8bff2d22321022f"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "4ff3cf2ff06ba24c2df07f3780306253fc75d23e3513d5a27d513810c163467e"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "bc03e7946dd15db7f04cf605aebea3fb7fe46aa09013556055cd52f1b274faba"
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
