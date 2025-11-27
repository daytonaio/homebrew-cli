class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.118.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "87134fbc8b62507c65423f98ad118e79fb052bab6c577dd3f96645e1125755d6"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "b5be087f9c161b4f026bf70e5294a36f96239c1f235347a6ea4fa53f98f0dd27"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "a99d525017f7fa1de5e2ced75d5fe2463f811ef774dc7777b215ef507ca282c1"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "95c7801ca33939db201830ae7b7e7dd5106a9561ae26975d2a5c8b022fcee54a"
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
