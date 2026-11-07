class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.231.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "4bb4aaba16731d466c062f642a85d3deba2c0a603e248e2d0ff3c4fd410dec7b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "6814953741c0cb94bfb2ad6b317e5bcb5c1702e7b5cbb5b084709ffd26d2e559"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "e594ba7571bdc40b95383dc8f97e2b3089f72f13f7a51737391a2a628a66a25c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "259eeb4255fadd9a08f216e09132a048c895e243c96d4df82724a9ecac00b838"
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
