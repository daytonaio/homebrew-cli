class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.194.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "a84e625ec67106692ca089bdf6a6d9c6d0a9001b1d06516ba48320b2a78b7278"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "fda68c8aa9ee2489cedc4dea1e3d005701362de061548dfa7f3fee1fcc4e71f7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "c417578dc5e68318f7bee80860f4b3e247844faf63f90310f8e278e62895b7e6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "435acb2c59f2f1cec087441c0fecae84ed8c54de1ee24773feaf9c49b89d3bd0"
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
