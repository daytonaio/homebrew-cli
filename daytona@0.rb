class DaytonaAT0 < Formula
  desc "Daytona CLI 0.x line (installs as `daytona-v0`, alongside the `daytona` formula)"
  homepage "https://daytona.io"
  version "0.230.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-darwin-arm64"
    sha256 "ccc366f967fbb8048e0cacbf8ed923fe9cf5379d1e20b55dc3d808d77ab8574a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-darwin-amd64"
    sha256 "150606beee6df04571569fe02cee76444916d2682c10315b8d523630a9ffa228"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-linux-amd64"
    sha256 "36e0d153b54de2ad0b41d562a1e0bd321c20d7d90ef8fcd02fc283eb5882cf52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-linux-arm64"
    sha256 "ead1afc5361f6a34c8b524f65bdd527d93abc947534e621d7fdda8f0133b63eb"
  else
    odie "Unsupported OS/ARCH combination"
  end

  def install
    bin.install "daytona-v0-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}" => "daytona-v0"
  end

  test do
    system "#{bin}/daytona-v0", "version"
  end
end
