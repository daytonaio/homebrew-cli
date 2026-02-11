class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.141.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "91acba3072d934971a521d5b8d551ed28ed57c176aceae83cd5066699cd7c147"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "8b9a21d68651fa674889a135aa9ace1129355fc42eb258b73822987becc20e64"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "e1d2ffc70f68187e968b60c0a8d57ea28525ad84e3633ae0b2a827c8818d09f2"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "96c145c2e3beaaca2fe62d5321bf4abefabf9287986af787dc93b1d91e54558d"
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
