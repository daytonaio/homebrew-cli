class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.200.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "92abad58c05b23e14858c62fa724920ff1cb9a6250674d6b0a60afabba927b81"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "b3bdd0248e55e743ce0160a4681cf1ac75fdf1fdf1887192bb2bf6b547b4007b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "c4fb19ec0dec69a16d7e4c18624509c6e44c0563e987005e14a3a4a658675f0e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "a295df95906979bb289b51d9839f4872e7edd248f8b2cb5b51ec6fca627c1720"
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
