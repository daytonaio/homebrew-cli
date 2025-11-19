class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.115.2"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "bb41e8adcf36b5f0f063469afdc61121e50b33a8aa309be7e4d55e5e103638fa"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "7aa7d2c4db30dc28fd67b18e85837ce438c9144e5e82a3011bf036f8f3974bd7"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "4a741e3d5e37411c6d9955214956a97f8ba775999819c2b7b0570d1bfd3a4215"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "102ff9ae54279003a8341cdb0bb0d749dd373453fad72e639a7272de926dbbe6"
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
