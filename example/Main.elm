module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dict exposing (Dict)
import Emoji exposing (Emoji, emojis)


type alias Model =
    { searchString : String
    , selectedEmoji : Maybe Emoji
    }


type Msg
    = SelectEmoji Emoji
    | UpdatePrefix String


model : Model
model =
    { searchString = ""
    , selectedEmoji = Nothing
    }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { update = update
        , view = view
        , model = model
        }


update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectEmoji selected ->
            { model | selectedEmoji = Just selected }

        UpdatePrefix prefix ->
            { model | searchString = prefix }


view : Model -> Html Msg
view model =
    let
        selectedEmojiString =
            case model.selectedEmoji of
                Just ( emojiString, emojiName, commonNames ) ->
                    emojiString

                Nothing ->
                    "No selection"
    in
        div
            []
            [ input
                [ type_ "text"
                , onInput UpdatePrefix
                , placeholder "Search for an emoji"
                ]
                []
            , h2 [] [ text selectedEmojiString ]
            , viewEmojiList model.searchString
            ]


viewEmojiList : String -> Html Msg
viewEmojiList searchPrefix =
    let
        filteredEmoji =
            Emoji.emojis
                |> Emoji.search searchPrefix
                |> Emoji.toList
    in
        div [] <|
            List.map viewEmoji filteredEmoji


viewEmoji : ( String, Emoji ) -> Html Msg
viewEmoji ( key, ( emojiString, emojiName, commonNames ) as emoji ) =
    div
        [ class "emoji"
        , onClick <| SelectEmoji emoji
        ]
        [ text emojiString ]
