class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.202.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "7f6ce10ca2ef25e6d027617d5893e058d3c2a5df5ef039bfbefc61b0758311e2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "b399329a70491907dc4ef483e37af8d189712fd02561202d4a7e9defe3b2e465"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "6dc9dd624657da1e76d85b6c50e9509a693640f9d8ecfaa9ca477bac6196fa40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "8b19f55d422dc05dd836b06e2e7aaa1e3ae95d387aaf5d911aa09e14e19d1fd7"
  else
    odie "Unsupported OS/ARCH combination"
  end

  def install
    bin.install "daytona-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}" => "daytona"
  end

  test do
    system "#{bin}/daytona", "version"
  end
end
