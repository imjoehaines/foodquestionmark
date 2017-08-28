module Main exposing (..)

import Navigation exposing (Location)
import Commands exposing (fetchRestaurants)
import Models exposing (Model, initialModel)
import Messages exposing (Msg)
import Routing
import View


main : Program Never Model Msg
main =
    Navigation.program Messages.LocationChange
        { init = init
        , subscriptions = \_ -> Sub.none
        , view = View.view
        , update = update
        }


init : Location -> ( Model, Cmd Msg )
init location =
    ( initialModel <| Routing.parseLocation location, fetchRestaurants )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Messages.Noop ->
            ( model, Cmd.none )

        Messages.LocationChange location ->
            ( { model | route = Routing.parseLocation location }, Cmd.none )

        Messages.FetchRestaurants response ->
            ( { model | restaurants = response }, Cmd.none )

        Messages.SelectRestaurant restaurantId ->
            let
                newForm =
                    { restaurantId = Just restaurantId }
            in
                ( { model | form = newForm }, Cmd.none )
