module Util exposing (..)

import RemoteData exposing (WebData)
import Models


restaurantName : WebData (List Models.Restaurant) -> Int -> String
restaurantName restaurants restaurantId =
    case restaurants of
        RemoteData.Success restaurants ->
            let
                list =
                    List.filter (\restaurant -> restaurant.id == restaurantId) restaurants
            in
                case List.head list of
                    Just restaurant ->
                        restaurant.name

                    Nothing ->
                        ""

        _ ->
            ""
