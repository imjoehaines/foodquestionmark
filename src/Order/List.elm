module Order.List exposing (..)

import Html exposing (Html, a, ul, li, time, text)
import Html.Attributes exposing (class, href)
import RemoteData exposing (WebData)
import Messages exposing (Msg)
import Models
import Routing
import Time.Format exposing (format)
import Util exposing (restaurantName)


view : WebData (List Models.Restaurant) -> List Models.Order -> Html Msg
view restaurants orders =
    ul [ class "orders" ] <| List.map (showOrder restaurants) orders


showOrder : WebData (List Models.Restaurant) -> Models.Order -> Html Msg
showOrder restaurants order =
    li []
        [ a [ href <| Routing.orderPath order.id, class "orders__order" ]
            [ time [] [ text <| format "%H:%M" order.time ]
            , text <| restaurantName restaurants order.restaurantId
            ]
        ]
