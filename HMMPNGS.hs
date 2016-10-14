module HMMPNGS where

import Data.HMM
import Data.Word
import Data.Array
import Codec.Picture.Png
import qualified Data.ByteString.Lazy as L
{-
data PngRawImage = PngRawImage
    { header       :: PngIHdr
    , chunks       :: [PngRawChunk]
    }
-}

type Event = String

png1 = ["PngRawImage",
        "header = PngIHdr",
        "colourType = PngGreyscale",
        "colourType = PngTrueColour",
        "colourType = PngIndexedColor",
        "colourType = PngGreyscaleWithAlpha",
        "colourType = PngTrueColourWithAlpha",
        "interlaceMethod = PngNoInterlace",
        "interlaceMethod = PngInterlaceAdam7"]

mmpng1 = simpleMM png1 1

{-Just PngRawImage {header = PngIHdr {width = 32,
				    height = 32,
				    bitDepth = 8,
				    colourType = PngTrueColour,
			 	    compressionMethod = 0,
				    filterMethod = 0,
				    interlaceMethod = PngNoInterlace},-}

array1 = listArray (1,6) ["PngRawImage",
                          "header = PngIHdr",
                          "colourType = PngTrueColour",
                          "interlaceMethod = PngNoInterlace",
                          "colourType = PngIndexedColor",
                          "interlaceMethod = PngInterlaceAdam7"]

mmpng2 = baumWelch mmpng1 array1 1

