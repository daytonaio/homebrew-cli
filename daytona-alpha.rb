class DaytonaAlpha < Formula
  desc "Daytona CLI (alpha channel — the V2 platform CLI; installs as `daytona`)"
  homepage "https://daytona.io"
  version "2.0.0-alpha.5"
  conflicts_with "daytona", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "b20b1a151ce46d9dd2b8c73eccc0ed2252ac1f7b50bc84cb6a6f820cb2a7f6e2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "720625c9939fb1b5e2c439dfc33cfb8ca861ff5d7a607193f22620ba0434eff9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "58e0e4dc62d73b7afe0c89091f270f905c527ad0782a311d0bb661c7fe8694b0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "1e1f7204ed74af076450125c2d4b26947a74461d93f5e4fb7a5ce822341342ec"
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
