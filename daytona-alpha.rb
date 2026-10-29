class DaytonaAlpha < Formula
  desc "Daytona CLI (alpha channel — the V2 platform CLI; installs as `daytona`)"
  homepage "https://daytona.io"
  version "2.0.0-alpha.4"
  conflicts_with "daytona", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "1b6acace07fdd585810acb77f3bbb26c6a63ca0773b5ed634777f22dba426102"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "56650e1bf6f6173ca2c2a8502aeae715fbbd45b7e3cf211f29d42632a5baac74"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "b47f9522052c8d2a6499bf18e6fcb76a6f3ff6ffae629bdfb88028a5c89c275c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "60363003e04869ab91aaedbf219c32c02fa07f186308ed2aac80a4150e9f3669"
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
