class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.152.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "194c0b37d1df432c30214b12846349cf1372dcde01ec244bf2b130c9e4a60943"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "f4a0793199b04542fcf601c6002015c78cfa306f8e90f2d13b9e30df52ee9056"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "beffd8c1f48a5f9d1bca3f42b26413dcbb7cd222451b07082d9f03a34fcedfb4"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "48c6b454d4a298b82947448149e6ef6228cb40b2cb6366000f4b33affec4366a"
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
