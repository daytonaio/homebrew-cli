class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.210.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "35f7a4473c4648acc92e6747bac0a669ad7bcaac4ecefab7f16ab449d53b7618"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "21a5d450c8361dfe27e21a9d65a61a06af7e60a522e3729c1d2d202614e40ca1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "4be18d12e7fe262047a2a1dcbe83055fc53bce902a7e4ca9c1cace500abf99ae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "7eeb647f4911888aad91e016bbf164852e2ffd22562eded7be950c3c6c6531cf"
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
