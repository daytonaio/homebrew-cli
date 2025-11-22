class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.117.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "d9f43a70d7d0bf2751a65e4182193cab58f5cf12b794fe094b9a8edabc20027e"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "6ff9cd09496ff4c66f58fe9a40b70f91ec7761947fc76e356c248bf22cb06957"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "d9835964948e55c672f74c7b074ac111c059a43ed932187e75d6dee6f1b98593"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "d8b0f7466ca8da61dfc4c8900f9334fcbf695673cdad37138ba6fe8570cb3600"
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
