class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.182.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "75ce636b590a0093de0a085dbe55585e6db12f45c27a997b2347b40202cc3757"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "94668a6853b52b5d4954b50c0b4369ffa52f7964a38dd525aa969271d18a891a"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "57d76968e00732bec00c9372882a1fbe0517e457ad3ce018823c72acebff711e"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "15021a57e178fa4cfb5238325f98ea4f3be3b9f20b79b4c684230d6ce174a75e"
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
