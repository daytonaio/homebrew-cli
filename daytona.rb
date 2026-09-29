class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.220.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "ad85217b4794072ac6c14fc6abe7be8d81626fba061032471805412acff543db"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "9250d532a5c330fd0913a78598e410f97103346389085ee478a8d755593b6a24"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "040c724f0c46ea86a12b74cca0522811172e977d4a9ac0607d5c05087f04736b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "e18029a168755a6495ea43d94f699c4746f485054c86f31deb625eb4b3019873"
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
