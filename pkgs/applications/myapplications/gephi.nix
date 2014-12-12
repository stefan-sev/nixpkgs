{stdenv, fetchurl, jre, makeWrapper, mesa, libX11, libXxf86vm}:

stdenv.mkDerivation {
  name = "gephi-0.8.2";

  src = fetchurl {
    url = "https://launchpad.net/gephi/0.8/0.8.2beta/+download/gephi-0.8.2-beta.tar.gz";
    sha256 = "0rdkkclaspiysya7vqfwj5fw4nzr62igvvfq57blvagrb5hdq1yc";
  };

  phases = [ "unpackPhase" "installPhase" "fixupPhase" ];

  buildInputs = [ jre makeWrapper mesa libX11 libXxf86vm ];

  installPhase = ''
    ensureDir $out
    cp -r . $out
  '';

  fixupPhase = ''
    for f in $out/gephi/modules/lib/linux-amd64/*.so ; do
      patchelf --set-rpath ${mesa}/lib:${libX11}/lib:${libXxf86vm}/lib $f
    done
    substituteInPlace $out/etc/gephi.conf \
      --replace Xmx512m Xmx1024m
  '';
}
