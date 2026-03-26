# This formula is automatically updated by GitHub Actions
# DO NOT EDIT MANUALLY

class OtelFront < Formula
  desc "Lightweight OpenTelemetry viewer for local development"
  homepage "https://github.com/mesaglio/otel-front"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.4/otel-front_v0.0.4_Darwin_arm64.tar.gz"
      sha256 "9bf765a761396c5d918378d60206e1f5f2ba8ea91589034f98d57b34e48405eb"
    elsif Hardware::CPU.intel?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.4/otel-front_v0.0.4_Darwin_x86_64.tar.gz"
      sha256 "c1d8782c14cfdf6d0c4ad44f7d934775f097527675ff3e34cb11819cc74cca84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.4/otel-front_v0.0.4_Linux_arm64.tar.gz"
      sha256 "f42307b21c041b11904d5f4dcbbe9e32968e5a0d006d31452e117b85b86e3807"
    elsif Hardware::CPU.intel?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.4/otel-front_v0.0.4_Linux_x86_64.tar.gz"
      sha256 "2ff56eba5eac1af65002336ac8d1904359f065850f968ba94f450a9bc7e955d9"
    end
  end

  def install
    bin.install "otel-front_darwin_arm64" => "otel-front" if OS.mac? && Hardware::CPU.arm?
    bin.install "otel-front_darwin_amd64" => "otel-front" if OS.mac? && Hardware::CPU.intel?
    bin.install "otel-front_linux_arm64" => "otel-front" if OS.linux? && Hardware::CPU.arm?
    bin.install "otel-front_linux_amd64" => "otel-front" if OS.linux? && Hardware::CPU.intel?
  end

  def caveats
    <<~EOS
      OTEL Front has been installed!

      To start the viewer:
        otel-front

      The web UI will open at http://localhost:8000

      OTLP endpoints:
        - HTTP: http://localhost:4318
        - gRPC: localhost:4317

      For more information:
        https://github.com/mesaglio/otel-front
    EOS
  end

  test do
    system "#{bin}/otel-front", "--version"
  end
end
