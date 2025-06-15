class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.16.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "0d8c50270f01f9c2981b567bc5731ca42da5a820993c579ffed4c27a7f0f759c"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "6128639e594f3eaf7813dd7834c0aff0af546028458744b76850257ebd95ee91"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "e7f84f4176a171c265aa008d9d289304e0608f123618d2c61c570f642f49bbc0"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "4498ba3fbc1663c33aea8408cfa1bc29cd67df709eaa9e9fab1f58d065b45b10"
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