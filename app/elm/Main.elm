module Main exposing (main)

import Html exposing (..)
import Html.App as App
import Area exposing (..)


main : Program Never
main =
    App.program
        { init = ( model, Cmd.none )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { areaModel : Area.Model }


model : Model
model =
    { areaModel = Area.initialModel }



-- UPDATE


type Msg
    = AreaMsg Area.Msg
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        AreaMsg msg ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    App.map AreaMsg (Area.view model.areaModel)
