class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.123.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "9eb3114c13da301cfdceeb91faa88457b6c967ed2d15d1e19d93dba7811a2cf8"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "88f97357b6f115a3808d6364f305eb8f5106cdce80420d18ca9963cd283c4956"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "b6ae790e906364b2cb750ce517d15a0bd4f4b48412f0471ae1b0bed7f88057d3"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "6318eac609b058784d1bc111f8c193f825e8b5b34dee33925c4bdd276c23a9df"
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
