class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.226.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "947f2f3217b04b1cbea4b300c1cdac2f17a2b3e70a770d7599d3207ee7997392"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "fce71d1326461b3511688be125ac97b3d9388bf5905a2b7213f6b01b363c34f3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "44a3640f7113d8381a886c4faf3d0a841fa620c73c927f5ed29823e8c0d3d300"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "533550b951cfab743f4db0afbdc5c18afe29d516b47b5010806287eaac8f972a"
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
