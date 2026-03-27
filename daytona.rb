class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.158.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "eecc94f4119b29f417c3980d4fccfff7d8a16b8839f7a3e5e9e16c46625f6a6e"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "2f1c47d944e1220ede0cba17d379455082a03ebcfaf04b111ecc0de50f3d48a7"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "c5486c2107b83d77e466d18185b602669a65235c74248fd51d2e7fcf3710de6d"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "18c93efd15011b1191a19581269ec6519b7500275f2480f456eb88782109d9b6"
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
