class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.107.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-darwin-arm64"
      sha256 "0fe2d2d17e08ab0ced354e65a4c33d68425520123cb969315727a9683b0207e8"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-darwin-amd64"
      sha256 "0f02497893ebd736963cd0bdd0e3abfa8cff6ec4cac17bb084dfbbc9048df718"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-linux-amd64"
      sha256 "fa2367321ccdfe060d2c9f4664fa99d10678838aac80fa3c127984c912d6aacd"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-linux-arm64"
      sha256 "b8d9b860f09ddc70dd61a2400612ec2da96b65d77cf2db633f883c9bc77022f1"
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
