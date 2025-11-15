# This formula is automatically updated by GitHub Actions
# DO NOT EDIT MANUALLY

class OtelFront < Formula
  desc "Lightweight OpenTelemetry viewer for local development"
  homepage "https://github.com/mesaglio/otel-front"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.1/otel-front_v0.0.1_Darwin_arm64.tar.gz"
      sha256 "2acb80d83ceb891eaf30c6d4554c3e0227989cf960244cc779c9a281ef8d5cfe"
    elsif Hardware::CPU.intel?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.1/otel-front_v0.0.1_Darwin_x86_64.tar.gz"
      sha256 "07b9bf6ece11837ec1208601a787d431735ea76c1bdb516d2bdf01390e9989a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.1/otel-front_v0.0.1_Linux_arm64.tar.gz"
      sha256 "73d44550d482b04936066f918beda61fd1553665a34fa27bc75d47a9d3c6fcc9"
    elsif Hardware::CPU.intel?
      url "https://github.com/mesaglio/otel-front/releases/download/v0.0.1/otel-front_v0.0.1_Linux_x86_64.tar.gz"
      sha256 "8e001ae8afe54798f55907e6ffdf4e2c82b25b64edb778aa8ca08dd88f9376e2"
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
