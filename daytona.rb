class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.145.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "6dc46aed184b24b7f5d5d2862648ad716903a808f81c03bf7f7341f17779dd14"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "8e8213b3de668265aca974c147d9313b8e783c549e56dbc289c5a565f10db856"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "34141bd8caa39efc6243bdc94c0eb68569ce9663e4ef933988cf4d80f34d84b7"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "9bf2b49c04eadf5766e4a473ca5cead4398ecbe6623dfd7f4e737ba7d86f42c8"
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
