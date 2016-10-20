module HMMPNGS where

import Data.HMM
import Data.Word
import Data.Array


data P = P { a :: Q,
             b :: R }
      deriving(Show,Eq)

data Q = A | B | C
      deriving(Show,Eq)

data R = E | F | G
      deriving(Show,Eq)

elemsP = ["a=A",
         "a=B",
         "a=C",
         "b=E",
         "b=F",
         "b=G"]

mmP = simpleMM elemsP 1

class ToStrings a where
    toStrings :: a -> [String]

instance ToStrings R where
    toStrings E = ["b=E"]
    toStrings F = ["b=F"]
    toStrings G = ["b=G"]

instance ToStrings Q where
    toStrings A = ["a=A"]
    toStrings B = ["a=B"]
    toStrings C = ["a=C"]

instance ToStrings P where
    toStrings p = toStrings (a p) ++ toStrings (b p)

i1 :: P
i1 = P { a = A,
         b = E }

i2 :: P
i2 = P { a = A,
         b = F }

i3 :: P
i3 = P { a = C,
         b = F }

i4 :: P
i4 = P { a = C,
         b = G }

i5 :: P
i5 = P { a = B,
         b = E }

i6 :: P 
i6 = P { a = B,
         b = G }

convert :: [P] -> [String]
convert [] = []
convert (i:xs) = (toStrings i) ++ (convert xs)

toArray :: [a] -> Array Int a
toArray s = listArray (1,length s) s

mmPTrained = baumWelch mmP (toArray (convert [i1,i2,i3,i4,i5,i6])) 5
