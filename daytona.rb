class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.224.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "f20520fd80db9cbbd134b62a3722f4df0ccf5fb9f382072ecd9f84dac8aee5c6"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "9b4cf39ff4420861cc868e98a3568c1a64fc9241a6de0d7aa763937ccf677745"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "dfa08c5326292670ee63604e03b8385d1c54ecff600c876da8f008f956b12b71"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "5f522975f714a4d91ec4cae5f6f8b78a1091cf2a4f6f789568947bbec2b9782f"
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
