{ stdenv }:

stdenv.mkDerivation {
  pname = "elm";
  version = "1.0.0";
  src = ./src;

  installPhase = ''
    mkdir -p "$out/bin"
    cp "$src/elm.sh" "$out/bin/elm"
    chmod +x "$out/bin/elm"
  '';
}
