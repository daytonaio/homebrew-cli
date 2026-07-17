class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.199.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "40f5a4cd9498a57ffc8323c3f86d13c0cb6224776f2dfcee03e8b01925d23e07"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "5dacafa529a0b8639aee5dc9cf98bd20e4a3a03bc8f2a98017c6c7dec5820cda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "74512ed3a6c4bc444e49a46a653b28a7423971f1c5431ce9336f0508f18f3651"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "328ddd67f6ba7106ad3b7ee05f71d55c906427f1a4123a37a1f7729ddeabe4d5"
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
