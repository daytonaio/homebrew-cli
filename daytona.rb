class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.130.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "b4f4f2db7b4ef9e142ae4a7dbf18d5ca84839e52492616347ae02eb55e80a48a"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "0e5e849e43cfd58adf51c0812b5926d79ac44cb194879dcdadf1cfe62026c950"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "3118406faab3703bb1c0ae19a4275a72a69abe5cc84d192ee475368d7074b468"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "c36a69f053076a2bca67d3ebbf97fff3cf0d516334c61fe7a40f706675b9d3c7"
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
