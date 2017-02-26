module TW.Tests.TestTree where

import Test.HUnit
import TW.Tree
import Data.Typeable

tests = test [ "Int type" ~: (typeOf (1 :: Int)) ~=? type1,
               "Getting Node" ~: (1 :: Int) ~=? (valOfNode $ getFromTree 1 tree1),
               "Getting Node2" ~: (4 :: Int) ~=? (valOfNode $ getFromTree 3 tree1)]
        where
          type1 = treeType tree1
          tree1 :: Tree Int
          tree1 = (Node 1 [Node 2 [Node 3 [Empty]], Node 4 [Empty]])

runTests :: IO Counts
runTests = runTestTT tests

