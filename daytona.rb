class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.192.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "2e263169a31f5268e9b651f36c5400d8b0c70f8e585f06f65b3281681105c38d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "22aac536f6464acc0459e3ed65687cbf22bfc268d5712183a7e5648ef264a8a8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "2047c0a5ff506c05f19a4fc3c71b3eccc5c59835bc3d57cde8a0efc80dbc9355"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "9f5d35744af9af17beee0ae84ec41d59b1c67e8f3b24700a716eea3784470315"
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
