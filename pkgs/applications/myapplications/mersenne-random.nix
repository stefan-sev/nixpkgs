{ cabal }:

cabal.mkDerivation (self: {
  pname = "mersenne-random";
  version = "1.0.0.1";
  sha256 = "193qz3wn7lz18aywddr9qyn8v08ifv2yxwr68c67p5mn8vr8mvmw";
  meta = {
    homepage = "http://code.haskell.org/~dons/code/mersenne-random";
    description = "Generate high quality pseudorandom numbers using a SIMD Fast Mersenne Twister";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
