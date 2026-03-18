class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.152.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "1da9f0f48ea315bf53769517851edcc99318736af79dd43d682bc9b5abce5235"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "a84efa3439362610c99d0c1ac6f8f6011fd63a8ab4ed52f36e1981ebe8926709"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "2f9171c190f63fe23e1793424add9b5304c756c9a71be2c3b5bfb92c6b7f45b8"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "ddb23c1b4757b9c4200621fb234a048fa36c16780dcc1f91642658f35ad032e3"
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
