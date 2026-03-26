class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.157.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "bcff7a48f9178f5ea5db588247f9f63067c3b45f28ecd318e8841c57bbd61c39"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "375b0d7f1fb43c976b630f58ff97ba76903f6cbb0f49ea906bc32b02ce2d944d"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "4ee5c802054b22b79a9320f0deb248dab5b8a97f0a5964b81cd857bbfb525663"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "8e82c82070410ccd90c4f5c3fb4e66a5609e1b1c378a663ffb17bf04353c011c"
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
