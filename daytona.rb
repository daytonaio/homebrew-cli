class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.183.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "7af875ff4e1edae185dedcba75d596d47ef6715d438b5f896165292a9682275f"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "bf222756e05c97917a2ab687eab34cc65b875192f7b325e88402e3d6668d7d44"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "91b0cdd50791582afad82720fd1f2e924aa560b4bd2c7bb6c4b67cb1b386b40c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "8fc3523c5f4ccbd0e2e324ffe3cb6760d8cac8ab049d1cc0e7f6439b2c8f16a1"
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
