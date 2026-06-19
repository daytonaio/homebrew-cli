class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.189.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "f181d1a6d641a6d119d5f524d5c8580fee557c65f3b698b31a973bad3eeb321c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "632baa5b22bd08abda7405722063d3c99b0fb27010db4417493d6f96d8b24880"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "0759d67a9a46d0f42381396455c961f1580a997dd742b2e0dda24c02602d98a5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytonaio/daytona/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "c9bee9dddfea4d43da23dc912aa9294a04279693929901a0898691b88deb1a08"
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
