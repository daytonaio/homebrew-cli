class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.155.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "4714afdbb88112beac2a000dbeb51df8be423a555f798724fb48067c168c7c52"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "eba856e35f63815b5b790b55d4ad5a9ea247fab81de55437641164328553bb9a"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "69d4417a2267304a90270d4fa6eaad050847abfd4ff113c2cdad2170f28e7a50"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "a5b2efc487884df7b79b48b7759aa05695c992e5395d8d5e4b61ac93e2dd3efb"
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
