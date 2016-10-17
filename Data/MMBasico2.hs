module HMMPNGS where

import Data.HMM
import Data.Word
import Data.Array


data P = P { a :: Q,
             b :: R }
      deriving(Show,Eq)

data Q = A
       | B
       | C
      deriving(Show,Eq)

data R = D
       | E
       | F
      deriving(Show,Eq)
{-
elemsP = ["a = A",
          "a = B",
          "a = C",
          "b = D",
          "b = E",
          "b = F"]

mmP = simpleMM elemsP 1 -}
