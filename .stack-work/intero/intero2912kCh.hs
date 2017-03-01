module TW.Tree where

import Data.Typeable
import Control.Monad.State

type Tree a = State (RealTree a) a
data RealTree a = Empty | Node a [RealTree a]
  deriving (Eq, Show)

-- treeType :: (Typeable a) => Tree a -> TypeRep
-- treeType tree = (\(Node a _) -> typeOf a) $ (evalState (tree>>get) 

getFromTree :: (Typeable a, Eq a) => Int -> Tree a -> Tree a
-- getFromTree n = state $ \tree -> (treeList [tree] !! (n-1),tree) where
--   treeList [] = []
--   treeList ts = ts ++ (treeList (concatMap childsOfNode ts))
getFromTree n = do tree<-get
                   return $ treeList [tree] !! (n-1)
  where
    treeList [] = []
    treeList ts = ts ++ (treeList (concatMap childsOfNode ts))

-- valOfTree = \_ -> state $ \tree -> (valOfNode tree, tree)

valOfTree = do tree <-get
               return (valOfNode tree)

childsOfTree = \_ -> state $ \tree -> (childsOfNod tree, tree)

valOfNode :: (Typeable a) => RealTree a -> a
valOfNode (Node x _) = x

childsOfNode :: (Eq a) => RealTree a -> [RealTree a]
childsOfNode (Node _ xs) = filter (\x -> x /= Empty) xs
