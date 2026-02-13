class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.143.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "5e9fdf7e8b574daa6b2fe04cff21daece5ea159ec4101ececa109f38c1937233"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "b667851719f46f61d9316b556bbc07a1469a9eec63a6560288a3d8a6c6f0d009"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "a8e20a2b863e3308d35d70445e3f293a72682a09b02417ed3def93d249334354"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "a4b6cd9674011cf89399f566c193481aa05ac7f982c7ff274af26ddf582df2a4"
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
