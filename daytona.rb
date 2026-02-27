class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.148.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "1c57eddec32f6e39c539684c30a7a394d1d0e4f8c5eff8d2933ca4b15c391d09"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "23c5727ebd6a59c3bef8f3bea7f3729dd85d0a72825aa0715e2d80d58837d6df"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "41f9f13c4210b8c0809cb7df5849e8f687ef859702f8b4d715992786659362e8"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "15955b5d6398c652dac26f8ac6931e596816361d8e490af7eaa73ec39848b9be"
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
