{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}

module Web.Sake.Utils where

import Text.StringLike

readM :: (StringLike str, Read a, MonadFail m) => str -> m a
readM str =
  case reads $ castString str of
    [(a, "")] -> return a
    _ -> fail $ "Could not read: " ++ show (toString str)
