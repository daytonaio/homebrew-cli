class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.204.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "333d83c53823b1bffda3445c7577c0adf9ffdd3e7cd032b6662ae6857ba46540"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "e1fc89a4a1561d69b3c09786fc0ca67df49ce621892ea5ecde077e6e34680a17"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "76701138c2ce93c14b30e7b10f51aa5ea2a9e156777bab933a4272237d81f14d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "fcc50f40d8f48bd4b562bfa0dc1e02d055de5f89e6177c8e8d7f391e9bfbb34e"
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
