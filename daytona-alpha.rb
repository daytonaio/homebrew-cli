class DaytonaAlpha < Formula
  desc "Daytona CLI (alpha channel — the V2 platform CLI; installs as `daytona`)"
  homepage "https://daytona.io"
  version "2.0.0-alpha.3"
  conflicts_with "daytona", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "22542a7aedd18f65222b0f758d2af4f4f4b170fa890f88c43c808861831a19da"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "d7af116a941405571ee2ec96c3ed9a238369620f3b5fdb01b37c4f4cd8caa310"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "b15f664365e75b18d5c6f9d844f7a0adb5e7efffcf9c13f3a9dbc76822b6cecf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "b5aa4c83f7503192070bc014155691f2dca34504fecbb54de2205b5620cbb8b4"
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
