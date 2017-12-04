module View exposing (..)

import Html exposing (Html, div, header, h1, a, button, main_, footer, text)
import Html.Attributes exposing (href, class)
import Models exposing (Model)
import Messages exposing (Msg)
import Order.List
import Order.New
import Order.Single
import Routing


view : Model -> Html Msg
view model =
    div []
        [ header [] [ h1 [] [ text "Food?" ] ]
        , main_ [] [ page model ]
        , footer []
            [ a [ class "button pull-left", href Routing.orderListPath ] [ text "Past Orders" ]
            , a [ class "button button--primary pull-right", href Routing.newOrderPath ] [ text "Create Order" ]
            ]
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Models.OrderListRoute ->
            Order.List.view model.restaurants model.orders

        Models.OrderRoute id ->
            let
                orders =
                    List.filter (\order -> order.id == id) model.orders
            in
                case List.head orders of
                    Just order ->
                        Order.Single.view model.restaurants order

                    Nothing ->
                        div [] [ text "" ]

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
