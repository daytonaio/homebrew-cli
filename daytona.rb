class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.135.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "876d79c8fce8ba9c95ca0ed3166bd018add2766a06b355dd9ab54132ad2ba9c6"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "28c70af0a898504cd20bfb19b32666fe857b5a7b1cbd64edb5bcc74027a87bff"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "35e6816ba671b7c00e5c7d634a8cff555f77e06af85fefa05e3654810e7dd6ab"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "bdfe619125175cbb3465ec99014b7c1e27fb864b7e3502404cab8afc13508e6c"
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
