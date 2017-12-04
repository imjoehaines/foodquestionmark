module Order.New exposing (..)

import Json.Decode as Json
import Html exposing (Html, form, div, label, text, select, option)
import Html.Attributes exposing (value, selected)
import Html.Events exposing (on)
import Html.Events.Extra exposing (targetValueIntParse)
import RemoteData exposing (WebData)
import Messages exposing (Msg)
import Models exposing (CreateOrderForm, Restaurant)


view : WebData (List Restaurant) -> CreateOrderForm -> Html Msg
view response orderForm =
    form []
        [ div []
            [ label []
                [ text "Restaurant"
                , restaurantList response orderForm
                ]
            , case orderForm.restaurantId of
                Nothing ->
                    text ""

                Just 1 ->
                    text "a real good menu"

                Just 2 ->
                    text "a pretty good menu"

                Just _ ->
                    text "a menu"
            ]
        ]


restaurantList : WebData (List Restaurant) -> CreateOrderForm -> Html Msg
restaurantList response orderForm =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success restaurants ->
            let
                options =
                    case orderForm.restaurantId of
                        Nothing ->
                            option [] [ text "---" ]
                                :: List.map (restaurantOption 0) restaurants

                        Just restaurantId ->
                            List.map (restaurantOption restaurantId) restaurants
            in
                select [ on "change" <| Json.map Messages.SelectRestaurant targetValueIntParse ] options

        RemoteData.Failure error ->
            text <| toString error


restaurantOption : Int -> Restaurant -> Html Msg
restaurantOption selectedRestaurantId restaurant =
    option
        [ value <| toString restaurant.id
        , selected <| selectedRestaurantId == restaurant.id
        ]
        [ text restaurant.name ]
