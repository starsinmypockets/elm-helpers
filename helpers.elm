module Main exposing (..)

{-| Combine a list of results into a single result (holding a list).
-}


combine : List (Result x a) -> Result x (List a)
combine =
    List.foldr (Result.map2 (::)) (Ok [])


numToList : Int -> List Int
numToList n =
    let
        strs =
            String.toList <| toString n

        maybeNs =
            List.map (String.fromChar >> String.toInt) strs

        combined =
            combine maybeNs
    in
        case combined of
            Ok ns ->
                ns

            Err x ->
                []
