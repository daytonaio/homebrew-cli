class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.120.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "e2d0c0fdb549d35377c48c29378875ef18ac5e8b41af205b5c76046eaaf20a41"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "f48b0927dad7cb0c4988f9391817f813143bc2c0ac4e25c85a5499fe34b8dcb2"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "d820361a01d7cd78db9a275399f98e79970591f228094c104ea9d0e9d2ef3cd8"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "4bce5091458db83fde04226df4d756e062c416077008bcc4f6cf821abfef279b"
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
