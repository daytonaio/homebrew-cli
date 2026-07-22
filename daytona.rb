class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.200.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "69f4dc75b7e4aecb49d6768148e7300ae24a51c0e4776939ebd12f4a6ee9974f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "e990ff4fef73c596897a552547461e21f40c5c5b4bd6c5bccd0355ac9e2f42e7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "788a15cc206ad9a4650fea2431bbb77da1535402bcc3ddeda95403bd59fb3ebf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "002d1e792c50d3f6c1262a8f78620ba6994b226018b1c6055f7f26f6e13685f9"
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
