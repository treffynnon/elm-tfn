module Tfn exposing (isValid)

{-| Test the validity of a given 8 or 9 digit Australian Tax File Number (TFN).

@docs isValid
-}

import Char

applyWeighting : List Int -> List Int -> Bool
applyWeighting x weights =
  x
    |> List.map2 (*) weights
    |> List.sum
    |> (flip rem) 11
    |> (==) 0

sanitiseInput : String -> List Int
sanitiseInput x =
  x
    |> String.filter Char.isDigit
    |> String.split ""
    |> List.map (String.toInt >> Result.withDefault -1)
    |> List.filter ((<=) -1)

{-| Check if a given 8 or 9 digit TFN is valid or not

  isValid "555-000-555" == True
-}
isValid : String -> Bool
isValid x =
  let input = sanitiseInput x
      apply = applyWeighting input
  in case List.length input of
       9 -> apply [1, 4, 3, 7, 5, 8, 6, 9, 10]
       8 -> apply [10, 7, 8, 4, 6, 3, 5, 1, 0]
       _ -> False