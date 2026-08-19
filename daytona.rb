class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.205.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "0fcad87c21c10b8fa2dce9570d3cf947f4ec795673eac3aab3d0955cae8062bc"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "9f43dcbf09641201b41da7ac1c2a965d8140cd6ac03dab18d436fff6079597d6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "b6a65e7ba0f70cba4be00e68376752a83a88d04ac634c6c9e8cc72d11dfece79"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "1580df1e5b155abad4f659b1e2573370fa6d42f0f30698873da7e340a5fca1c7"
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
