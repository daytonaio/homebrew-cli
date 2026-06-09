class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.185.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "1f5fd64bca22e83227b30df3d2e8a47e2374ae0e70e6c5d9aadfce67820230ee"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "c6531a2c1582b074998d48517c95751fb0072a3b2b114f7217a9e23570a0eee2"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "789217aa99d59a6360b00782c6f9f5a4a77eb770b1cd5542c7e82dcdef0f5bb5"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "6de72c41d1d86775f60e075b33c252ee1ab7a55d07dfbd4dfca8c07f8cd97516"
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
