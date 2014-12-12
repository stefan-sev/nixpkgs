{ cabal, mtl, parsec, zlib }:

cabal.mkDerivation (self: {
  pname = "pngload";
  version = "0.1";
  sha256 = "1j8zagi5xcb4spvq1r0wcnn211y2pryzf0r8z7h70ypqak7sy6ps";
  buildDepends = [ mtl parsec zlib ];
  meta = {
    description = "Pure Haskell loader for PNG images";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
