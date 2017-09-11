import Control.Monad
import System.IO

maxLineLen :: Int
maxLineLen = 42

main = main' 0

main' counter
--maxLineLen = 50
 = do
  p <- hIsEOF stdin
 -- to swap above line to IsEOF requires extra import
  unless p $ do
    x <- getLine
    let newLength = length x
    let ellipsis =
          if newLength > maxLineLen - 1
            then "..."
            else ""
-- display shows line count starting at 1
-- need to allow say 3 digit space : 001 with leading zero supression
    let message =
          show (counter + 1) ++
          " " ++ show newLength ++ " " ++ take maxLineLen x ++ ellipsis
    putStrLn message
    main' (succ counter)
