class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.149.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "1682e4728152631caf0c79ebb120424fb7cbb214f5d5a54bf159f5d1d72c692b"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "09f38cb10d4928c2b2a6af42e76deaf47b20efe38e41c87d7b6699ee9759ed45"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "2fe9b1f155b73d2d167352a01ed0584225d360d4ab3002e68d6fc639ca5c666c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "438a27525e8038d11ba2fe426705507f117c658ee31ab59b478c64a82ef03aac"
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
