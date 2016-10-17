module HMMPNGS where

import Data.HMM
import Data.Word
import Data.Array


data P = A
       | B
       | C
      deriving(Show,Eq)


elemsP = "ABC"

mmP = simpleMM elemsP 1

genP = "AAABBBBCAAAABBCCABABBBAAA"


toArray :: a -> Array Int a
toArray s = listArray (1,length s) s

mmPTrained = baumWelch mmP (toArray "AAABBCBBCCAAABBCAAABBC") 5
