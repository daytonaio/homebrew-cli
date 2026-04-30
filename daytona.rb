class Daytona < Formula
    desc "Daytona CLI"
    homepage "https://daytona.io"
    version "v0.171.0"
  
    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-arm64"
      sha256 "3c575ebd1e7009b94281dd4ecc3b3869e5a9ac0918e6d32ad619a47f3f396a1d"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-darwin-amd64"
      sha256 "e8583429594d918de646291d9a6197936a36d18b53424a096c8b86a87f82d76f"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-amd64"
      sha256 "2e926a6a4eda575a843310c92663d09cda99961fffda318516874a11ede94726"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/daytonaio/daytona/releases/download/#{version}/daytona-linux-arm64"
      sha256 "d5d82129904bbb26112720c1e12372dfdf7db14fc58118c0eab33ff0fadffbb7"
    else
      odie "Unsupported OS/ARCH combination"
    end
  
    def install
      bin.install "daytona-#{OS.mac? ? 'darwin' : 'linux'}-#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}" => "daytona"
    end
  
    test do
      system "#{bin}/daytona", "version"
    end
  end
