class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.127.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "36060cbf59aeddeff5cf48d125122f2961bf2ee21b9efc76e5dd5e477aec3f98"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "92361dceac021079ef934734e80fdb72b45ebee1e7ac1eb28434d19e0fa709a9"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "206ff5fa5e3442479c471f957a4228ba681510b348f0bd68f6fe80eb583e85f1"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "aaf09ac3ce04f03d2f79e54e8f545006bf901226fcae7ed60147476e9252a63f"
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
