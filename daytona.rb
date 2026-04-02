class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.160.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "87e1f6cc193c19e2abd85a79ee8fe50f8cb85f65a7d9c0b3de1663cbee8d7ee3"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "39130ff369e60a1e831f11a8518c393849d1900147b8bba053fa8b69736f8d23"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "f159780aca2d73e4233f9551bcf19d7b7250ea71365a7fdc4eb425e3da4a366d"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "71f690de570d837bcc18c5daadb023687d66c203bfd7adffcff2627cd9cf2d1b"
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
