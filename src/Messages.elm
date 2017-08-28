module Messages exposing (..)

import Navigation exposing (Location)
import RemoteData exposing (WebData)
import Models exposing (Restaurant)


type Msg
    = Noop
    | LocationChange Location
    | FetchRestaurants (WebData (List Restaurant))
    | SelectRestaurant Int
