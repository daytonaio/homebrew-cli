class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.138.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "0bf7a605a866d1a3015b2f84575888c3b48562a368e2659f2288988c28106bf6"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "610ebbed4343efbe5e82508280d0eec9885107dee04a02868cd373e090b580d0"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "a325b45dcc1e244b67522cc6baf640d6f1e85b583e9fc118b857b53576c13899"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "a42bda2b5fe0c1f5e3033f63d0bdacae54742ea21f664ba1412a44fcb1017dc7"
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
