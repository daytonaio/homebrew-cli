class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.139.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "8ad1658241e72a74fbeb01a640dff7e9bff45c7fe5744a04de4040cf6728f90a"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "85d6cd7a7c18705eebf9ae2f42742f2c7679730a685aed0e39d5e9a2547721d4"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "d9111307324d193cc52badb8a5f0322e1fd72e89e6c57b3c42c780d45eb460ca"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "884719b4a438e71fb466c79f6c7891d10f949df0450f9be6ef39bf2643c92bee"
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
