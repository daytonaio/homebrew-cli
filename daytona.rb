class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.162.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "b1cf4410f409ddf68cc02bd4a922aa52d25d844ba97ac4e3b030a4dbf28825fe"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "af7e059465952c46a46818e1421981623a97bfe26f55309d0e30bd2cbbc78273"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "e911bf4e0046536c676b20aed8d1236e46a9634b72eb32aab77cde31fc304c3c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "cc2a7169954af809dadb1315baf659790e6756b1aed3dc4642793ef5e0c006c0"
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
