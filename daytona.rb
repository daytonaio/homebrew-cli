class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.201.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "babb46fc19d44761ff4c535bebf36dce5313a3d82b375f97fc92358c8f0d4866"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "88a87f9707d1de16b6598341ef9ec70f546cd840814c3c9491c29f556827d5ac"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "e012a7152ca98f31087713d96987f2b39dc102400398c465be5e04f6bc94946c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "17dd174e740b33da706136267bb29a1f834790f236434f6040cd4cb1fd831753"
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
