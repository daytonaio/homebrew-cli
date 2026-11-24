class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "2.2.0"
  conflicts_with "daytona-alpha", because: "both install the `daytona` binary"
  conflicts_with "daytona-rc", because: "both install the `daytona` binary"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "8059fac2817a9d820b497d21c6f046aab1013acb2a529f7fc93ff51fb58ae288"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "58a165d80c2824b17340978bed579d1593aa0431db0e77516643dbd18f5e2a12"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "b9d7325e88fe8048fb31ec7fae44469eb35302d81cab2e9679fa51aa782522e7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "747b1fecdda2d801c788bf47268baa2ae6f12813d72aa0537b8272179b4b8cbf"
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
