class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.115.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "facb3efb9811bc313efaf81990596a12537e9fd9a3c3551cc507f51ea8dfd80e"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "e509433d698eb2bb7379da857f8672c1663a322cd3d2ede29e4f503a92826ec4"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "08b0d97af79e14b8779f5504ec1fc839f79eb33f9e513bc9600a875fe2de8593"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "ec427c44301574646f9a5130ccca6ccdd4e0e7ab9e6e4c34ab952af40b29e2c7"
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
