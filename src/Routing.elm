module Routing exposing (..)

import Navigation exposing (Location)
import Models exposing (OrderId, Route(..))
import UrlParser exposing (Parser, (</>))


matchers : Parser (Route -> a) a
matchers =
    UrlParser.oneOf
        [ UrlParser.map OrderListRoute UrlParser.top
        , UrlParser.map OrderRoute (UrlParser.s "orders" </> UrlParser.int)
        , UrlParser.map NewOrderRoute (UrlParser.s "orders")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (UrlParser.parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


orderListPath : String
orderListPath =
    "#"


orderPath : OrderId -> String
orderPath id =
    "#orders/" ++ toString id


newOrderPath : String
newOrderPath =
    "#orders"
