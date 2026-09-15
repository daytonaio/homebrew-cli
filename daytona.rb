class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.214.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "548497c88beee23424dc959149c0ecc7075f8caae1a6d7e992b8da6237529326"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "103f229335e276a881e61b6157ffd8b3d62d27ed1d8ad552d97d283e460ccb56"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "6a685b5c295dc93114573490ecc28a01c2137f895fe2ba23edb76d1377eda8f0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "f9f42a51449110d83f11a447bce74f7124b1f3bb9e3564b864d14bc3bca588b4"
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
