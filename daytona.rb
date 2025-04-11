class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.14.4"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "4b13ac63bfc4b8a8fb95565347ee129603c679efc19e597373318b42aa73b284"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "3acad212de61d9352bb0519f8eb88b972d06420a3ced9ca238bda80b6ff30498"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "11180dc53ba86b5bab11c303fb18ccab73b7b504cdbbeeeeaac220b0e9bdd2af"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "c9e3e9aed5d9fab94cc76d1afe8fb24c364f146e694449001657e4b6180cba41"
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