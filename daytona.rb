class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.195.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "65cc758c27494acf7db06e143cdf3a44ce2378b412b9ca1d9bc5f36f1ca27b67"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "c793545d8e19dc99ffa65d77e32c24a3caa76c15d686c691864e034f20b77125"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "33ec05fbd27b9c46070d9244b8d0f2079e2e0b41ea8f456a824d82810f026778"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "dbbabd9330378fc8b251be33d5e8552c4a1683cf356f8875c0763393d5757d9c"
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
