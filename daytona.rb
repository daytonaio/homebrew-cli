class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.140.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "1e5d3b843d77c060f5756f38e01f877545870e26e185e7d45f219d23e0d96cc2"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "bd27c28e1b7055bdfb83b57a814c72192df5cac8cf69208194c2b5f879c3e055"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "b98d1616ad4cf7d00b833924cd4b814158e2d3a8cbe6f333a251a0ccfd73e67c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "c8d7a39f5126b27872c70df12593275a4c2d6c919ac38fbe5185481561313ad0"
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
