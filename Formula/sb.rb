class Sb < Formula
  desc "Lightweight, local-only task management CLI"
  homepage "https://github.com/Martins6/simple-beads"
  url "https://github.com/Martins6/simple-beads/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4f48a0d09b520c908543558166de96b40579e8a0084259c70968422436a6b390"
  license "MIT"

  depends_on "go" => :build

  on_macos do
    depends_on macos: :monterey
  end

  def install
    ENV["CGO_ENABLED"] = "1"
    system "go", "build", *std_go_args(output: bin/"sb"), "."
  end

  test do
    system bin/"sb", "init"
    system bin/"sb", "create", "homebrew-smoke"
    assert_match "homebrew-smoke", shell_output("#{bin}/sb list")
  end
end
