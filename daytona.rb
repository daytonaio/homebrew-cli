class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.198.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "a3e02b6967aaec7d28abf7289cd48aec651cf60699ccff5bf12421e2b710538a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "92c6218e042101009c5077290d989d9e534fd91aecd94432576b16f16aeea52d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "b5fbc05d195e016cb2db05ef009a19dc3a30b4e9f4729199d9b093acb30596a5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "0d2fdd117eb5b25b3253b7ea1e8bf462c0e3e2bc588c1491e954eca3d98ac1a8"
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
