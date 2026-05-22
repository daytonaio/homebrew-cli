class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.179.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "6432cbecace57d842b50016cdf1237e3f8f9c4deb1221da397ac3adb59c6012b"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "ee866b759ac71c879e2b83d6f98344c0e47f213da8c9f9ddca3e5fee0a18ab52"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "81e3f8c9b3476442deeec4c43f44a0448d7b335c73f7389d4267255406c886bd"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "abb955f623f6e111443b98118bc3e1562c191083bfa737e92bc4d91ea279db33"
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
