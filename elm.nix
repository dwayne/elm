{ elmPackages, lib, makeWrapper, stdenv }:

stdenv.mkDerivation {
  pname = "elm";
  version = "1.0.0";
  src = ./src;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src/elm.sh $out/bin/elm
    chmod +x $out/bin/elm
  '';

  #
  # Problem: How do I tell the script which dependencies I want it to use?
  #
  # These resources were very useful in helping me figure out what to do here.
  #
  # https://nixos.org/manual/nixpkgs/stable/#fun-makeWrapper
  # https://nixos.org/manual/nixpkgs/stable/#fun-wrapProgram
  # https://gist.github.com/CMCDragonkai/9b65cbb1989913555c203f4fa9c23374
  # https://github.com/NixOS/nixpkgs/blob/234bb31f611f43f8b744b305ab82035de637aaca/pkgs/build-support/setup-hooks/make-wrapper.sh
  #
  postFixup = ''
    wrapProgram $out/bin/elm \
      --set PATH ${lib.makeBinPath [
        elmPackages.elm
        elmPackages.elm-test
      ]}
  '';
}
