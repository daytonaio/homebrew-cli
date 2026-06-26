class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.192.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "f6d7c4074281e5a8211a9d9bf19b7732d99ebd8079eed414e14a6e6914a6337c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "b6f9768576f9db1f23b959aec7c8ae5c6896874f9ea972b0b46ab7bd728414e2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "7a1bbedd11ccba94fc7579878b084da6299b3a32901b2b43c97838fd684f9ecc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "5d9487e9888de3d84366ce44d4ff86c0aafe999196500429220f824cf968067c"
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
