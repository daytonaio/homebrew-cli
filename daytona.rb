class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.207.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "de63274aef4fae652f3c97ff8190c4bcd43e6b7034689cecc8490eadbd62c7d2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "46a69b28ff3521d6916d0aecae464b007693a3c579b07cc78d9597709bb9b0b8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "39b6db86f06e38ebabc6f891465ffbba72e19574bde32c534dea810ec3e48a2f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "46754795ac18c2c001a132ac1d71966eedf210eee6da1097a6ce68c631cdbdc4"
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
