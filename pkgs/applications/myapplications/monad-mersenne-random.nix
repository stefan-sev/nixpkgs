{ cabal, mersenneRandomPure64 }:

cabal.mkDerivation (self: {
  pname = "monad-mersenne-random";
  version = "0.1";
  sha256 = "03kbqbgv4npzfzn90jk4p17y8kb62sslby6q36819qkif1j76lq6";
  buildDepends = [ mersenneRandomPure64 ];
  meta = {
    homepage = "http://code.haskell.org/~dons/code/monad-mersenne-random";
    description = "An efficient random generator monad, based on the Mersenne Twister";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
