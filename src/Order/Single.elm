module Order.Single exposing (..)

import Html exposing (Html, div, h1, ul, li, text)
import Html.Attributes exposing (class, href)
import RemoteData exposing (WebData)
import Messages exposing (Msg)
import Models
import Util exposing (restaurantName)
import Time.Format exposing (format)


view : WebData (List Models.Restaurant) -> Models.Order -> Html Msg
view restaurants order =
    div []
        [ h1 [] [ text <| restaurantName restaurants order.restaurantId ]
        , div [] [ text <| "Ordered at " ++ format "%H:%M %-eth %B %Y" order.time ]
        , div []
            [ ul []
                [ li [] [ text "some stuff probably idk" ]
                , li [] [ text "calzones i guess ??" ]
                ]
            ]
        ]
