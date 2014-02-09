-- |
-- Copyright   : Anders Claesson 2014
-- Maintainer  : Anders Claesson <anders.claesson@gmail.com>
-- License     : BSD-3
--

module Math.Freq
    ( freqMap
    , freq
    , distMap
    , dist
    ) where

import Data.List
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

freqMap :: (Ord k, Num a) => [k] -> Map k a
freqMap xs = Map.fromListWith (+) $ zip xs (repeat 1)

freq :: (Integral k, Num a) => [k] -> [a]
freq [] = []
freq xs = map find [0 .. fst (Map.findMax d)]
    where
      d = freqMap xs
      find k = Map.findWithDefault 0 k d

distMap :: (Num a, Ord k) => (b -> k) -> [b] -> Map k a
distMap f = freqMap . map f

dist :: (Integral k, Num a) => (b -> k) -> [b] -> [a]
dist f = freq . map f
