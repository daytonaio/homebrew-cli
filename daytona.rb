class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.164.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "7acf390dbbf4edfff080a6a186f293473e760ce57d7607239632112805f586c2"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "504996b946b644e623b4cb38e35cba0ba8a7012b79f97903c3a29c0988a0a3a8"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "8e86ef464299b95eab9093078902a50ec529247adc5ca233e6ab3ca6393bcd77"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "30a4705cea97759594bc225afb49e3362874e588662de04f5873e526d8c4ac4d"
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
