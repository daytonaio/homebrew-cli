class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.211.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "a9d46682ec95d041082aa82e3d2be1a330fdedd11d131ff734d4f603f2fac5fa"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "a956046f9c127694af5c6ee3be672c4d529be8c905688d715483e36b3a638217"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "2eecfc233e37066e7d81770cdb948f03671d6ef4739d669da3c47d476fabd3a4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "50ca7ee75de7e9312338ab85057a3b2e469f35d210d12edf349ad25668c4f974"
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
