{ cabal, primitive, transformers }:

cabal.mkDerivation (self: {
  pname = "monad-primitive";
  version = "0.1";
  sha256 = "1vi6g65hdyq5vq78mfag0qljxgzb6vq83m82x3cpgjl7dr9k5h1x";
  buildDepends = [ primitive transformers ];
  meta = {
    homepage = "http://bitbucket.org/Shimuuar/monad-primitive";
    description = "Type class for monad transformers stack with pirimitive base monad";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
