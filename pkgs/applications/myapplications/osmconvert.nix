{stdenv, fetchurl, zlib}:

stdenv.mkDerivation {
	name = "osmconvert-0.7T";

	src = fetchurl {
		url = "http://m.m.i24.cc/osmconvert.c";
		sha256 = "8759d2b7a02ce8bb030e5b78d7b2fb7087fb2164e235bb822b927e636a6a9697";
	};

	phases = [ "buildPhase" "installPhase" "fixupPhase" ];

	buildInputs = [zlib];

	buildPhase = ''
		gcc -lz -O3 -o osmconvert $src
	'';

	installPhase = ''
		mkdir -p $out/bin
		cp osmconvert $out/bin
	'';

}
