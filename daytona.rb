class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.233.0"
  conflicts_with "daytona-alpha", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "1e773bce19b0fce3fbea6e0160985be70607b9006e3e6a30ab1c4fa5bb367bc2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "209d0e0a35eb6a5297999bfe1a97b87b0565361f988ec4b59bcc2b360bce8090"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "e436da386f8e9bdb5d1d93f64ee6d07353aa3b2a28fbe86ab50bd663bae92fb0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "feb36a0a8220f672bb2b096c89f0dc4123c3755228120bf0b8a2d30ab2f326e1"
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
