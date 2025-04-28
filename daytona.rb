class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "0.14.8"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-arm64"
      sha256 "1dde0eeb85b0bf4f2dfa629cfce744d7a70144841fe2f0442f82efc390df8c43"
    elsif OS.mac? && Hardware::CPU.intel?    
      url "https://download.daytona.io/cli/#{version}/daytona-darwin-amd64"    
      sha256 "e771da29c44ba00b0e6b147f569abf774bd257446f249e9034229616addb7415"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-amd64"
      sha256 "0b77c1167643a7e440f36d2aa7bef8afc11f859bbf0386b28f4b993d79efbd0d"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://download.daytona.io/cli/#{version}/daytona-linux-arm64"
      sha256 "4f9c6d1bca6fddd041cba6119f704faf6e9b74f41b948e2e90ca4b68659bca06"
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