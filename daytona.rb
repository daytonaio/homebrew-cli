class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.173.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "af05ffc407b88df90c1a84ff2d61f1033733dddfbef59e637ad0e8957b6e3336"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "4cf3f4e782789f37abbd6741a6be138c6e045473900af4f69c99699581c8541e"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "c2e1e2b88796dfeb63a8510ae69aea95f547189da9f6c1fdadd5913f28ca9205"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "bbb02fee06e09abe17e37ea95e16d84bf925aa43709151f94d57b733258b9266"
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
