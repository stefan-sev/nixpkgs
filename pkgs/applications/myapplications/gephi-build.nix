{stdenv, fetchgit, jdk, makeWrapper, mesa, libX11, libXxf86vm, ant}:

stdenv.mkDerivation {
  name = "gephi-git";

  src = fetchgit {
    url = "https://github.com/gephi/gephi.git";
    rev = "23b47bfe12";
  };

  #phases = [ "unpackPhase" "installPhase" "fixupPhase" ];

  buildInputs = [ ant jdk makeWrapper mesa libX11 libXxf86vm ];

  buildPhase = ''
    cd src
    ant
  '';
}
