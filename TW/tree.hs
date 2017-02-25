module TW.Tree where

import Data.Typeable
data Tree a = Empty | Node a [Tree a]

treeType :: (Typeable a) => Tree a -> TypeRep
treeType (Node a _) = typeOf a
