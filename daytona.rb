class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.193.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "25e8e6a1cc7bf74b829c9f8855e08610573e508b2ad7684d2354f2212e00fd52"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "6f3f18aba4fa7dc094196e61ffa3eacef87f0845938c01dde333f424b82b78ee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "c6afff5e344983c620a0fee4009d4fbe022745f1bee72d109b54678b43e448bc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "1c246fb58bd0c31d0dc5db21452b59738609679fad15aa1f234595b0656fff6c"
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
