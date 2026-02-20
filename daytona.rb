class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.144.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "5e267b9610afb6bedb8727359d3eccd06739f3c4bea0e18a4541c2abe5abdd31"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "856125bb1afcac8cd93864863ec7a881ef0b187f0450cf402067a71005d4f816"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "16a8127c037a149c350d0f3f3f69113b5632e036ca9949a733110dae7eab5e7c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "98e67d8097b22725559a24b792257de897fce7c6e4aaa322a1e73bb5774904e0"
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
