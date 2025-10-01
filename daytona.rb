class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.106.3"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "b771dbe21855f708b640c1ada3dabdc5e497026b054082cbe466b1317a36a580"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "60f5401acf5f464eaf513b6c6e8d04c1bcadd0883eaef4715e0552e98f1d8348"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "3fe9b4b767f1fb157c27d5e6ad3e368f9f226104f7a44feb9310487e5c8de75c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "dd8ede187c264e390ce41e4ba288cfe6dcba5da0ea6cb3b82b815f15a8d900de"
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
