class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.132.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "31aa7214599555a2b9e596bf2be2dfdd7f4e1c5b43d15ea1ac5f0fe42bd3c4ed"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "c1a1d7c1badbc8a316dfec5ea6b498487c0f716a0e869270cc46c2114e147690"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "83f4fb0a74fc2cd152639fba34b88433b4f63200d63bc2cd4026edfa16eeb134"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "63ad601d3e1c8d43595b93bd39d4bd7cb3b96e11b84a9fa7f904e691cacbd547"
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
