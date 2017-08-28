module Order.List exposing (..)

import Html exposing (Html, ul, li, text)
import RemoteData exposing (WebData)
import Messages exposing (Msg)
import Models


view : List Models.Order -> Html Msg
view orders =
    ul [] <| List.map showOrder orders


showOrder : Models.Order -> Html Msg
showOrder order =
    li [] [ text <| toString order ]
