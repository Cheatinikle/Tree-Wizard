module TW.Tests.TestTree where

import Test.HUnit
import TW.Tree
import Data.Typeable

test1 = TestCase (let (type1, type2) = (treeType tree1, treeType tree2) in
                    do assertEqual "Testing Tree with int type" (typeOf (1 :: Int)) type1
                       assertEqual "Testing tree with String type" (typeOf ("s" :: [Char]))type2)
  where
    tree1 :: Tree Int
    tree1 = (Node 1 [Node 2 [Empty], Node 3 [Empty]])
    tree2 :: Tree [Char]
    tree2 = (Node "s" [Node "e" [Empty]])


tests = TestList [TestLabel "Type test" test1]

runTests :: IO Counts
runTests = runTestTT tests

