# This formula is automatically updated by GitHub Actions
# DO NOT EDIT MANUALLY

class OtelFront < Formula
  desc "Lightweight OpenTelemetry viewer for local development"
  homepage "https://github.com/mesaglio/otel-front"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.3/otel-front_v0.0.3_Darwin_arm64.tar.gz"
      sha256 "628bf5a25ea9f4a377ae8d1ee2d95c3a2ff1211979c8a5a1250d6842cd214dc6"
    elsif Hardware::CPU.intel?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.3/otel-front_v0.0.3_Darwin_x86_64.tar.gz"
      sha256 "bc13a6794e67730149d8f7e6982c26002bd5d7e647c2a6ed30895075d77a9d87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.3/otel-front_v0.0.3_Linux_arm64.tar.gz"
      sha256 "da113140544e03b4b9dbd00d0fa732f55af9594222285ef4d5b86386e78d507d"
    elsif Hardware::CPU.intel?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.3/otel-front_v0.0.3_Linux_x86_64.tar.gz"
      sha256 "46d65ea572edeea5c38cf3cb5d68ab6d4055f912a6404abf7bc7d6b4bfd1bdf6"
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
