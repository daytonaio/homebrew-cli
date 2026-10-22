class Daytona < Formula
  desc "Daytona CLI"
  homepage "https://daytona.io"
  version "0.226.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-arm64"
    sha256 "a03169b6f02a9288d87103956cc650f19012b0021d6aff7fce191c8048f12a02"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-darwin-amd64"
    sha256 "4fa61ce3accb1fa3fcca956b17523359929ec8cabcb18714612157a09f5c6483"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-amd64"
    sha256 "0c25c1a252d8663491ac6b2bb88982bc88ebdcfc9514b9cc2a73803098a449e0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/daytona/clients/releases/download/v#{version}/daytona-linux-arm64"
    sha256 "8886c0ed676ddd938a7ff7cf9cc7942a86945d2634ba39cd85a4dd6ec91fd5e7"
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
