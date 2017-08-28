module Models exposing (..)

import RemoteData exposing (WebData)


type alias OrderId =
    Int


type Route
    = OrderListRoute
    | OrderRoute OrderId
    | NewOrderRoute
    | NotFoundRoute


type alias Order =
    { restaurantId : Int
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
    , orders = []
    , form = initialForm
    , restaurants = RemoteData.Loading
    }
