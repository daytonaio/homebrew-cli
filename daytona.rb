class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.217.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "6c75233471aa18bdc524e72b9cc937a1d1f2ff89cac886d1cfbeeb03acff8f39"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "29a42c48bc3f44399efee88cea7d10d53f3b8fa5a91a9feafe5a0fcae74a501b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "a1696936e1d9f33f464695bcbd8328e53a4bf80932dd241180e34a563d9a1999"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "3cbb9511dff18651b044b09a63968bb3cf3675bf8f845136ee36e5382e6a137d"
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
