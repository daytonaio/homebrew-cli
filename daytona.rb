class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.154.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "8580f0ef3c5edc75bfe7aad5dbb9aacc89c6024a7df10880722249fdd6f965ef"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "9615bec004c24a6d38dcdf9014e4697060157473ec1d3641dd43bf71fd582765"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "0ced6cde29f15494e4279b9724d5ab9b65cdb3b8dfdfa5cba91a7f12dd0c6986"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "b043c7a70846a9eac188c7debdf6860da75aaf0ba6537179aaa3c632bc7d7ed1"
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
