class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.187.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "c1492ac963a589421e8932e974957cb6e2a6040e68363d5220c54ccfede48ecf"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "51c9d575380b64d2a645fd1cfa3c7d79837380ccbe6e77044ba97489cf0db702"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "253f7bfd30710ae70150d65fa51d3516c652b5a633e1b740d1393f5fc3f0b75e"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "f24f5631e5be9f78799c73c0bc943487b38949d3f356a1bc4eabb8a32829228b"
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
