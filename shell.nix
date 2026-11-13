{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    gcc
  ];

  buildInputs = with pkgs; [
    cairo
  ];

  packages = with pkgs; [
    uv
    python3
  ];

  # Hilft vorkompilierten Wheels aus PyPI (z. B. numpy, pillow), System-Libs zu finden
  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.stdenv.cc.cc.lib
    pkgs.zlib
    pkgs.cairo
  ];
}
