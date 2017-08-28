module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Messages exposing (Msg)
import Models exposing (Restaurant)
import RemoteData


fetchRestaurants : Cmd Msg
fetchRestaurants =
    Http.get "/api/restaurants" restaurantListDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Messages.FetchRestaurants


restaurantListDecoder : Decode.Decoder (List Restaurant)
restaurantListDecoder =
    Decode.list restaurantDecoder


restaurantDecoder : Decode.Decoder Restaurant
restaurantDecoder =
    decode Restaurant
        |> required "id" Decode.int
        |> required "name" Decode.string
