class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.122.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "f20f5b415d5067bdcf6770c1fd1521120682f88b8190dd94ae6bf74c857be14b"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "71fafc536795f7ba0c469ba5bbd52823dacfb17d4e3113bb419d622fc3823cb1"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "febee72576106f55989ec559c00fab26512da883416e5323642c04827cb8106d"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "44204fab3c162b85e14357b7af7f4b0f53a2daf3ea2b176b2c7caa6cc64fd0cb"
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
