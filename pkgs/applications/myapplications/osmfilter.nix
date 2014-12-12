{stdenv, fetchurl}:

stdenv.mkDerivation {
	name = "osmfilter-1.2S";

	src = fetchurl {
		url = "http://m.m.i24.cc/osmfilter.c";
		sha256 = "4546fba3cd5e481adf43efd063240381a96500637bb9fe16c4ca54a3c3578a7b";
	};

	phases = [ "buildPhase" "installPhase" "fixupPhase" ];

	buildPhase = ''
		gcc -O3 -o osmfilter $src
	'';

	installPhase = ''
		mkdir -p $out/bin
		cp osmfilter $out/bin
	'';

}
