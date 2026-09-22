class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.215.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "7c11474f6d13f3a6efe9210158d2b5b41248a245cc1c3338bb2c22241768ed74"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "2e1db4241964a48650de8b9489f2744522fb03c76f8661026330fabc25086335"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "e4f90653e36de23f19464dd423bbf9dcd8d3624b2399c9388945b5ecbff1a9e2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "10c90f6cc48fd8159d5fb1ccbab3eb5fb072fcb62bbc8479a011c61bbee492aa"
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
