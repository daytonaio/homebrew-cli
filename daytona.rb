class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.222.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "b3f25fc4b29df1019f797a31b870369a7281ecf2bf6750f348cb2b9de45ae42f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "d140a609ab037f9195005296ad4513c91fcf6d0dc5a4f952fcc809281c051e7a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "22edfd18e503dc3a0dec5d0a7f2c56086e37baffbc3df4d8758d53497545f66c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "d1d9da4b27a46343eb40898bebce4d906d4468dfb4f669e4155d781c0f5332c5"
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
