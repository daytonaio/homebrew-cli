class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.146.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "02153888dcc679ea364048249c2d9aa613c4e50f38bb7d2779d9d001464b2dd0"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "37687e4465340a6fe6258d135d9da299753bc4b64b2106dd60b3710f3c7badb8"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "c71cf4e6d0074be91067913ace7d03360ccb5d06649758b44b6c0795866174f8"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "adf9cb1ef0796fa8ce5631840a74574670ec31ce8595445962966c82d2604446"
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
