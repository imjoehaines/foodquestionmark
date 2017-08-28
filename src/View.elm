module View exposing (..)

import Html exposing (Html, div, h1, a, text)
import Html.Attributes exposing (href)
import Models exposing (Model)
import Messages exposing (Msg)
import Order.List
import Order.New
import Routing


view : Model -> Html Msg
view model =
    div []
        [ page model
        , div [] [ a [ href Routing.orderListPath ] [ text "Order List" ] ]
        , div [] [ a [ href <| Routing.orderPath 1 ] [ text "Single Order" ] ]
        , div [] [ a [ href Routing.newOrderPath ] [ text "New Order" ] ]
        , div [] [ a [ href "#404" ] [ text "404" ] ]
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.OrderListRoute ->
            Order.List.view model.orders

        Models.OrderRoute id ->
            orderView

        Models.NewOrderRoute ->
            Order.New.view model.restaurants model.form

        Models.NotFoundRoute ->
            notFoundView


orderView : Html msg
orderView =
    div []
        [ h1 [] [ text "Single Order" ]
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ h1 [] [ text "404 — Not found :(" ]
        ]
