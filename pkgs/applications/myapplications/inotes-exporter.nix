{stdenv, fetchgit, maven}:

stdenv.mkDerivation {
	name = "inotes-exporter-git";

	src = fetchgit {
		url = "https://github.com/javabean/iNotes-exporter.git";
		rev = "6bbd0bafaf";
		sha256 = "1gi2mlafg20gk3cv2l1fdjj1shayw9rvw8i8b8i4sdnxm8k2rngb";
	};

	buildInputs = [ maven ];

	buildPhase = "mvn -Dmaven.test.skip clean assembly:assembly -DdescriptorId=jar-with-dependencies";

	installPhase = ''
		ensureDir $out/libexec/inotes-exporter/
		cp target/iNotes-exporter-1.8-jar-with-dependencies.jar $out/libexec/inotes-exporter
		ensureDir $out/bin
		cat >> $out/bin/inotes << EOF
#!/bin/sh
server=\$1
shift
user=\$1
shift
pass=\$1
shift
java -Dinotes.server=\$server -Dnotes.user=\$user -Dnotes.password=\$pass -jar $out/libexec/inotes-exporter/iNotes-exporter-1.8-jar-with-dependencies.jar \$*
EOF
		chmod 755 $out/bin/inotes
	'';
}
