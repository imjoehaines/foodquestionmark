module Models exposing (..)

import RemoteData exposing (WebData)
import Time exposing (Time)


type alias OrderId =
    Int


type Route
    = OrderListRoute
    | OrderRoute OrderId
    | NewOrderRoute
    | NotFoundRoute


type alias Order =
    { id : Int
    , restaurantId : Int
    , time : Time
    }


type alias Restaurant =
    { id : Int
    , name : String
    }


type alias CreateOrderForm =
    { restaurantId : Maybe Int
    }


type alias Model =
    { route : Route
    , orders : List Order
    , form : CreateOrderForm
    , restaurants : WebData (List Restaurant)
    }


initialForm : CreateOrderForm
initialForm =
    { restaurantId = Nothing }


initialModel : Route -> Model
initialModel route =
    { route = route
    , orders = [ Order 1 1 1512395843751 ]
    , form = initialForm
    , restaurants = RemoteData.Loading
    }
