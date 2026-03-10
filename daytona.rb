class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.150.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "c65ed3db2c33b6e20c88b8f702234e734a32d11b129fcbb4b0a533cbf4724662"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "325d90473a95dec39979ec8ccb9816af194afc70cf1a892b17c60b46b2ba49e4"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "2e9327174ad384a26740ab3e25ce2d7c5a7d0a19c84d210d59a7ad9aa8181659"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "28fdae2bab8cf5b732164ddc0cb07062eb8064cc6758c317b6c8f213537ae98c"
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
