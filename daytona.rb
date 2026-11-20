class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "2.1.0"
  conflicts_with "daytona-alpha", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "07744960d443e31566008d23c7207084f89d4e6f50c7856d8a69aabeb90b903a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "5f2b824c4108ab2f06769313e86ae8ceb88681db85aef354b7b9b3257f1f721c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "8cb5c381c0c064f53a1013ccc2b46df7c6dd611648ad18b000aeee8c6e8c988a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "66b556f8e80dd522c96baf24f08e08a1a6f435cd77a86ece630a7e8a60259982"
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
