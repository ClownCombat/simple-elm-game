module Area exposing (..)

import Html exposing (..)
import Html.Attributes exposing (attribute, class)


-- MODEL


type alias Model =
    { numberBoxes : Int
    , boxesList : List Box
    }


type alias Box =
    Maybe Monster


emptyBox : Box
emptyBox =
    Maybe.Nothing


rabbitBox : Box
rabbitBox =
    Maybe.Just rabbit


type alias Monster =
    { name : String, health : Int }


rabbit : Monster
rabbit =
    { name = "Hase", health = 20 }


initialModel : Model
initialModel =
    { numberBoxes = 3, boxesList = emptyBox :: [] }



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ attribute "class" "outer-container" ]
        [ div [ attribute "class" "row" ] [ field emptyBox, field emptyBox, field rabbitBox, field emptyBox ]
        , div [ attribute "class" "row" ] [ field rabbitBox, field emptyBox, field emptyBox, field rabbitBox ]
        ]


field : Box -> Html Msg
field box =
    case box of
        Nothing ->
            div [ attribute "class" "field" ]
                [ text "-" ]

        Maybe.Just monster ->
            div [ attribute "class" "field" ]
                [ text ("Hase | " ++ (toString monster.health)) ]
