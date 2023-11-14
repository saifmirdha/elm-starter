module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (..)
import Tailwind.Button exposing (primaryBtn)


type alias Model =
    Int


initialModel : Model
initialModel =
    0


view : Model -> Html Msg
view model =
    div [class "flex h-screen"]
        [ div [class "m-auto"]
            [ button [ onClick Decrement, class primaryBtn ] [ text "-" ]
            , span
                [ class "text-sm px-4 font-bold"
                ]
                [ text (String.fromInt model) ]
            , button [ onClick Increment, class primaryBtn ] [ text "+" ]
            ]
        ]


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
