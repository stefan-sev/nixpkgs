{stdenv, fetchurl}:

stdenv.mkDerivation {
	name = "asyncns-0.8";

	src = fetchurl {
		url = "http://pkgs.fedoraproject.org/repo/pkgs/libasyncns/libasyncns-0.8.tar.gz/1f553d6ce1ad255bc83b3d8e9384f515/libasyncns-0.8.tar.gz";
		md5 = "1f553d6ce1ad255bc83b3d8e9384f515";
	};
	
	meta = {
		description = "C library for executing name service queries asynchronously";
		licence = "LGPL";
	};
}
