class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.158.1"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "1440dc15a9e8e0cc06daa80d077020bf9e3ae363b5f8da540fa79193e5cacee0"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "0826e86497c836a3e8f5d79a1084cf163059c4534167bfa0a152f9a9e7e7ca25"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "0402ce545aaec2d2f13db713a25c1b103608eb50b04bf1cd166cc02454f1e199"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "6305a07c12127d183cda5404c61a78fc141e7e18b15693f473a3c5ab9f8d68ce"
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
