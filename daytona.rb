class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.119.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "3886cb09b406447dd6928963cb47fde61aee17290af6f992855485bd3a2b7976"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "92b2a91dfbde8c12afdf8056791b0fed510018787ec233f7ba80ad4033530f94"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "03a776e97ab558f5261e83e7fc4f7138fbe70fcdbddd0ebc99ff3771c98c22ef"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "e227897a51efead8f9f722a14868b2a04240d0daadc9a4c290b511d01001da26"
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
