{stdenv, makeWrapper, fetchurl, perl, perlPackages}:

stdenv.mkDerivation {
	name = "mtkbabel-0.8.3.1";

	src = fetchurl {
		url = "mirror://sourceforge/mtkbabel/mtkbabel-0.8.3.1.tar.gz";
		sha256 = "c054f32ac6b2adf0815b485695b50e23f24bb147d0357c5df10c76098f9eddad";
	};

	phases = [ "unpackPhase" "installPhase" "fixupPhase" ];
	buildInputs = [ makeWrapper perlPackages.serialPort perlPackages.TimeDate] ;

	installPhase = ''
		mkdir -p $out/bin
		cp mtkbabel $out/bin
		substituteInPlace $out/bin/mtkbabel --replace "/usr/bin/perl" "${perl}/bin/perl"
	'';

	fixupPhase = ''
		wrapProgram $out/bin/mtkbabel \
			--set PERL5LIB "${perlPackages.serialPort}/lib/perl5/site_perl:${perlPackages.TimeDate}/lib/perl5/site_perl"
	'';
}
