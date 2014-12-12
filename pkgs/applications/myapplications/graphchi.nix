{stdenv, fetchgit, zlib, which, wget, makeWrapper}:

stdenv.mkDerivation {
  name = "graphchi-git";

  src = fetchgit {
    url = "https://github.com/GraphChi/graphchi-cpp.git";
    rev = "9a628aeb71";
  };

  buildInputs = [ zlib which wget makeWrapper ];

  buildPhase = ''
    bash install.sh
  '';

  installPhase = ''
    ensureDir $out/bin
    cp -r . $out
    PROGS=`find . -type f -executable`
    for f in $PROGS ; do
      cp $f $out/bin
      wrapProgram $out/bin/$(basename $f) \
        --set GRAPHCHI_ROOT $out
    done
  '';

}
