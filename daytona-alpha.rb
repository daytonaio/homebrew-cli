class DaytonaAlpha < Formula
  desc "Daytona CLI (alpha channel — the V2 platform CLI; installs as `daytona`)"
  homepage "https://daytona.io"
  version "2.0.0-alpha.12"
  conflicts_with "daytona", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "ecd7618b3193f5e3d155c5ef4cc059ecd4a48893882274dc5c6a5bbbf70ea798"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "f2f6d25c9971eeaeb90dfdc206439310cf0d7bb509c8e496ec51355e2c4da559"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "bd039b02a2dc684b922d243f2501bbc7634eecb883c3065aaca7c9b6de3b5143"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "600c5683054a706680039fd3ae6c2537ceea2179d4b4bc3ed2ad849050765863"
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
