module TW.Tree where

import Data.Typeable
import Control.Monad.State

data Tree a = Empty | Node a [Tree a]
  deriving (Eq, Show)

treeType :: (Typeable a) => Tree a -> TypeRep
treeType (Node a _) = typeOf a

getFromTree :: (Typeable a, Eq a) => Int -> Tree a -> Tree a
getFromTree n tree = treeList [tree] !! (n-1) where
  treeList [] = []
  treeList ts = ts ++ (treeList (concatMap childsOfNode ts))

valOfNode :: (Typeable a) => Tree a -> a
valOfNode (Node x _) = x

childsOfNode :: (Eq a) => Tree a -> [Tree a]
childsOfNode (Node _ xs) = filter (\x -> x /= Empty) xs
