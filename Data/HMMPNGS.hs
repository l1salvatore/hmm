module Data.HMMPNGS where

import Data.HMM
import Data.Word
import Codec.Picture.Png
import qualified Data.ByteString.Lazy as L
{-
data PngRawImage = PngRawImage
    { header       :: PngIHdr
    , chunks       :: [PngRawChunk]
    }
-}

data States = TPngRawImage --0
                 | TPngIHdr --1
                 | TPngRawChunk --2
                 | TWord32 --3
                 | TWord8 --4
                 | TPngImageType --5
                 | TPngInterlaceMethod --6
                 | TChunkSignature --7
                 | TByteString --8
               deriving (Eq,Show,Ord,Enum)

data Observables = ElemWord8 Word8 --0
                 | ElemWord32 Word32 --1
             --    | ElemPngImageType PngImageType --2
             --    | ElemPngInterlaceMethod PngInterlaceMethod --3
                 | ElemByteString L.ByteString --4
                deriving (Eq,Show,Ord)

type HMMPngRawImage = HMM States States


ip :: States -> Prob
ip s = 1/9
{-    0  1  2  3  4  5  6  7  8
   0 
   1
   2
   3
   4
   5
   6
   7
   8
-} 
tm :: States -> States -> Prob
tm = undefined

om :: States -> States -> Prob
om = tm
{-
tm s1 s2 | s1 == toEnum 0 :: States && s2 == toEnum 0 :: States = 0.0
         | s1 == toEnum 0 :: States && s2 == toEnum 1 :: States = 0.5
         | s1 == toEnum 0 :: States && s2 == toEnum 2 :: States = 0.5
-}

                       

