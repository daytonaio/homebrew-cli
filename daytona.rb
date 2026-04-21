class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.168.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "dd7cae8171b8442886280d337b74eb5ffaaf67527c28bc0644d555f5e9b6decc"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "67b10ed2a7a08ceeef4f074a395603ef801707da1fdc8ac416512b56b89bea05"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "f5e1b480ebcbc67e63c495dea5bcada5d6caa4b2054bf3c7c23b50462a5f65db"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "d39333b3833e4b3fd8b423d2be20d17d82287d82708f67c47e096c4d5dbb3a13"
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
