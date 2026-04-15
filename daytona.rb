class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.166.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "cb829b6db36fea65ce7850473edd4f5167de1cf7479038f5138b58420d0d9f7b"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "f58f2ab558e5af292c39e5d5bc8388b7bc1301aff8139f13ed764834d387826f"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "16cada27cda94e9cdccff4a893cc01afa369881ab1ff741f07fc37d3b9126e24"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "208189f59097a543d68ed639fcd2099d5d2a5f675374141cfab7a9be33e8ea12"
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
