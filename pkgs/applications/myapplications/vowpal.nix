{ stdenv, fetchurl, boost, zlib }:

stdenv.mkDerivation {
	name = "vowpal_wabbit-7.5";
	
	src = fetchurl {
		url = "https://github.com/JohnLangford/vowpal_wabbit/archive/7.5.tar.gz";
		sha256 = "078d54gdaw084d76z94yd94rms5sv9vymkrg0jzdzjwvlwj99m31";
	};
	
	buildInputs = [ boost zlib ];
	
	configureFlags = "--with-boost-libdir=${boost}/lib";
}
