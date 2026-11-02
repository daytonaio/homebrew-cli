class DaytonaAT0 < Formula
  desc "Daytona CLI 0.x line (installs as `daytona-v0`, alongside the `daytona` formula)"
  homepage "https://daytona.io"
  version "0.227.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-darwin-arm64"
    sha256 "c9164c7160a8f16baa36ee26cfc12a3c165787eeacb0b0d0281dd83cb4ae7b67"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-darwin-amd64"
    sha256 "b4406020f0a66be79f88de16f1ad43cd44732367464b3962fe76e4972f5252bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-linux-amd64"
    sha256 "b8d6971af948a21c470b29d41f28706e90d31477296573a2b4b90882794b865f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-v0-linux-arm64"
    sha256 "a8f25a97642632a3578f3c2364625afa1a2ae558650cfb5e0a8de808bd7a85df"
  else
    odie "Unsupported OS/ARCH combination"
  end

  def install
    bin.install "daytona-v0-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}" => "daytona-v0"
  end

  test do
    system "#{bin}/daytona-v0", "version"
  end
end
