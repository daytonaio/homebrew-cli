class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.136.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "f70d948ef97fe905a40cfe4f5cdbeeb568844739cf4ce69b4f21c84b5651403e"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "f81f7b5a9c0969e1b2f913739889f2f5e25c608c971c9f8a9beba7b9d0856d1a"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "4d484757773876c6ec384b3d3fa5904fc808e412a4ea746234e435d1be36e5a8"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "c090ece04af847f8d70bc1cf26ff1e2b5030dc927fab12842650156c3f1c302d"
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
