module TW.Tree where

import Data.Typeable
data Tree a = Empty | Node a [Tree a]
  deriving (Eq, Show)

treeType :: (Typeable a) => Tree a -> TypeRep
treeType (Node a _) = typeOf a

treeAt :: (Eq a) => (Tree a -> b) -> Int -> Tree a -> b
treeAt f n tree@(Node x xs) = f $ treeList [tree] !! (n-1) where
  treeList [] = []
  treeList ts = ts ++ (treeList (concatMap childsOfNode ts))

treeSet :: (Eq a) => (Tree a -> Tree a) -> Int -> Tree a -> Tree a
treeSet f n tree@(Node x xs) = treeAt f n tree

getFromTree :: (Eq a) => Int -> Tree a -> a
getFromTree = treeAt valOfNode

valOfNode :: Tree a -> a
valOfNode (Node x _) = x

childsOfNode :: (Eq a) => Tree a -> [Tree a]
childsOfNode (Node _ xs) = filter (\x -> x /= Empty) xs
