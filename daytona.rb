class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.112.2"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "2887246432557e187495b480648e2f88a87dd0d8f9de538e9766065eec72e373"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "d34206ca2ebc0446ab6817aa690ad28639fc89b1fc20da55554dc7ddb9aa3a54"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "6657da2b60a071b151c508d250aca24918bb58e3819e17693f485dc37e15b3e7"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "f01d2e79b2600c76aa37d52abdcd9cb4fe7672600960b12075ae728dfda78fbe"
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
