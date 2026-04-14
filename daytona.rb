class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.165.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "7f68b9edc313a1d17470e998abb2468e11a384a9ff2302eec9c79ba25dc3d6b5"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "bb54a928f61849abf03a8d046603c4e6c43c1ff73228476556452e5022881e0b"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "34274d234ea156dd08214e321603bd1d42d6f68bcd67e3fa594479674010e357"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "2c188694184c02e891ac61b78544f252fd1fdc83a9a8ad3512a64844efe96d80"
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
