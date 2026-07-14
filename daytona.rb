class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.197.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "8a85189128ce2347dfda4ea2929318dd15b1796534af96f27bb935412ccc8e55"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "bdd3ed4aea97a4ab14478e329516d0845edf49977ef206496bd7042b60ed2346"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "75493c6a41e7f0a427e116f150310d1669fd01529d37e7b4abaf89034cb9193b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "1d1c2591d43269d5573e75d07021d8c5a222872aef3dd6f5fb8f7ba0fd78e2ed"
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
