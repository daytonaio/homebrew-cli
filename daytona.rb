class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.16.5"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "3dad33b395eb095148ef94f10e956d86ee91502075743e4d98e762e4f66f08bd"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "1341933b642dd5e2eac6b8a664e9bda263ea6390c21178e97fbfb225cffc3a21"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "7d9fb5c72cd97fa653e50cb09d13342b58bea1db46caadae3b159957e1ba604b"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "ea9cce2e96fdc5f4c383eb3d12481b43f7d08e016dbad8fdc9bb7c1febd494aa"
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