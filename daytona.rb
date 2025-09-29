class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.106.2"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "3100999b78671ca5e491498e577bfcfc701fbe1feb67d42ece36bc4195114734"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "4339bfa3b65ed7b98492b2d22bb97e75988d14914c4cac4dadd63bbb9aa7c890"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "c0bcf28d21aeb6532df369d10556da00bbba630ac292a9d4b956b4fbea4a96f3"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "ff1b1ae0376260fe9e7b44219fd3460a90bd029745c5264ce0859dc197a62810"
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
