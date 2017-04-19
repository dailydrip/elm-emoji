module Emoji exposing (Emoji, Emojis, emojis, toList, search)

import Dict exposing (Dict)


type alias Emoji =
    ( String, String, List String )


type alias Emojis =
    Dict String Emoji


toList : Emojis -> List ( String, Emoji )
toList =
    Dict.toList


emojiContains : String -> String -> Emoji -> Bool
emojiContains prefix key ( emojiString, emojiName, commonNames ) =
    commonNames
        |> List.any (String.contains prefix)


search : String -> Emojis -> Emojis
search prefix emojis =
    emojis
        |> Dict.filter (emojiContains prefix)


emojis : Emojis
emojis =
    emojiList
        |> Dict.fromList


emojiList : List ( String, Emoji )
emojiList =
    [ ( "00a9", ( "©", "copyright", [ "copyright" ] ) )
    , ( "00ae", ( "®", "registered", [ "registered" ] ) )
    , ( "203c", ( "‼", "bangbang", [ "bangbang" ] ) )
    , ( "2049", ( "⁉", "interrobang", [ "interrobang" ] ) )
    , ( "2122", ( "™", "tm", [ "tm" ] ) )
    , ( "2139", ( "ℹ", "information_source", [ "information_source" ] ) )
    , ( "2194", ( "↔", "left_right_arrow", [ "left_right_arrow" ] ) )
    , ( "2195", ( "↕", "arrow_up_down", [ "arrow_up_down" ] ) )
    , ( "2196", ( "↖", "arrow_upper_left", [ "arrow_upper_left" ] ) )
    , ( "2197", ( "↗", "arrow_upper_right", [ "arrow_upper_right" ] ) )
    , ( "2198", ( "↘", "arrow_lower_right", [ "arrow_lower_right" ] ) )
    , ( "2199", ( "↙", "arrow_lower_left", [ "arrow_lower_left" ] ) )
    , ( "21a9"
      , ( "↩"
        , "leftwards_arrow_with_hook"
        , [ "leftwards_arrow_with_hook" ]
        )
      )
    , ( "21aa", ( "↪", "arrow_right_hook", [ "arrow_right_hook" ] ) )
    , ( "231a", ( "⌚", "watch", [ "watch" ] ) )
    , ( "231b", ( "⌛", "hourglass", [ "hourglass" ] ) )
    , ( "23e9", ( "⏩", "fast_forward", [ "fast_forward" ] ) )
    , ( "23ea", ( "⏪", "rewind", [ "rewind" ] ) )
    , ( "23eb", ( "⏫", "arrow_double_up", [ "arrow_double_up" ] ) )
    , ( "23ec", ( "⏬", "arrow_double_down", [ "arrow_double_down" ] ) )
    , ( "23f0", ( "⏰", "alarm_clock", [ "alarm_clock" ] ) )
    , ( "23f3", ( "⏳", "hourglass_flowing_sand", [ "hourglass_flowing_sand" ] ) )
    , ( "24c2", ( "Ⓜ", "m", [ "m" ] ) )
    , ( "25aa", ( "▪", "black_small_square", [ "black_small_square" ] ) )
    , ( "25ab", ( "▫", "white_small_square", [ "white_small_square" ] ) )
    , ( "25b6", ( "▶", "arrow_forward", [ "arrow_forward" ] ) )
    , ( "25c0", ( "◀", "arrow_backward", [ "arrow_backward" ] ) )
    , ( "25fb", ( "◻", "white_medium_square", [ "white_medium_square" ] ) )
    , ( "25fc", ( "◼", "black_medium_square", [ "black_medium_square" ] ) )
    , ( "25fd"
      , ( "◽"
        , "white_medium_small_square"
        , [ "white_medium_small_square" ]
        )
      )
    , ( "25fe"
      , ( "◾"
        , "black_medium_small_square"
        , [ "black_medium_small_square" ]
        )
      )
    , ( "2600", ( "☀", "sunny", [ "sunny" ] ) )
    , ( "2601", ( "☁", "cloud", [ "cloud" ] ) )
    , ( "260e", ( "☎", "phone", [ "phone", "telephone" ] ) )
    , ( "2611", ( "☑", "ballot_box_with_check", [ "ballot_box_with_check" ] ) )
    , ( "2614", ( "☔", "umbrella", [ "umbrella" ] ) )
    , ( "2615", ( "☕", "coffee", [ "coffee" ] ) )
    , ( "261d", ( "☝", "point_up", [ "point_up" ] ) )
    , ( "263a", ( "☺", "relaxed", [ "relaxed" ] ) )
    , ( "2648", ( "♈", "aries", [ "aries" ] ) )
    , ( "2649", ( "♉", "taurus", [ "taurus" ] ) )
    , ( "264a", ( "♊", "gemini", [ "gemini" ] ) )
    , ( "264b", ( "♋", "cancer", [ "cancer" ] ) )
    , ( "264c", ( "♌", "leo", [ "leo" ] ) )
    , ( "264d", ( "♍", "virgo", [ "virgo" ] ) )
    , ( "264e", ( "♎", "libra", [ "libra" ] ) )
    , ( "264f", ( "♏", "scorpius", [ "scorpius" ] ) )
    , ( "2650", ( "♐", "sagittarius", [ "sagittarius" ] ) )
    , ( "2651", ( "♑", "capricorn", [ "capricorn" ] ) )
    , ( "2652", ( "♒", "aquarius", [ "aquarius" ] ) )
    , ( "2653", ( "♓", "pisces", [ "pisces" ] ) )
    , ( "2660", ( "♠", "spades", [ "spades" ] ) )
    , ( "2663", ( "♣", "clubs", [ "clubs" ] ) )
    , ( "2665", ( "♥", "hearts", [ "hearts" ] ) )
    , ( "2666", ( "♦", "diamonds", [ "diamonds" ] ) )
    , ( "2668", ( "♨", "hotsprings", [ "hotsprings" ] ) )
    , ( "267b", ( "♻", "recycle", [ "recycle" ] ) )
    , ( "267f", ( "♿", "wheelchair", [ "wheelchair" ] ) )
    , ( "2693", ( "⚓", "anchor", [ "anchor" ] ) )
    , ( "26a0", ( "⚠", "warning", [ "warning" ] ) )
    , ( "26a1", ( "⚡", "zap", [ "zap" ] ) )
    , ( "26aa", ( "⚪", "white_circle", [ "white_circle" ] ) )
    , ( "26ab", ( "⚫", "black_circle", [ "black_circle" ] ) )
    , ( "26bd", ( "⚽", "soccer", [ "soccer" ] ) )
    , ( "26be", ( "⚾", "baseball", [ "baseball" ] ) )
    , ( "26c4", ( "⛄", "snowman", [ "snowman" ] ) )
    , ( "26c5", ( "⛅", "partly_sunny", [ "partly_sunny" ] ) )
    , ( "26ce", ( "⛎", "ophiuchus", [ "ophiuchus" ] ) )
    , ( "26d4", ( "⛔", "no_entry", [ "no_entry" ] ) )
    , ( "26ea", ( "⛪", "church", [ "church" ] ) )
    , ( "26f2", ( "⛲", "fountain", [ "fountain" ] ) )
    , ( "26f3", ( "⛳", "golf", [ "golf" ] ) )
    , ( "26f5", ( "⛵", "boat", [ "boat", "sailboat" ] ) )
    , ( "26fa", ( "⛺", "tent", [ "tent" ] ) )
    , ( "26fd", ( "⛽", "fuelpump", [ "fuelpump" ] ) )
    , ( "2702", ( "✂", "scissors", [ "scissors" ] ) )
    , ( "2705", ( "✅", "white_check_mark", [ "white_check_mark" ] ) )
    , ( "2708", ( "✈", "airplane", [ "airplane" ] ) )
    , ( "2709", ( "✉", "email", [ "email", "envelope" ] ) )
    , ( "270a", ( "✊", "fist", [ "fist" ] ) )
    , ( "270b", ( "✋", "hand", [ "hand", "raised_hand" ] ) )
    , ( "270c", ( "✌", "v", [ "v" ] ) )
    , ( "270f", ( "✏", "pencil2", [ "pencil2" ] ) )
    , ( "2712", ( "✒", "black_nib", [ "black_nib" ] ) )
    , ( "2714", ( "✔", "heavy_check_mark", [ "heavy_check_mark" ] ) )
    , ( "2716", ( "✖", "heavy_multiplication_x", [ "heavy_multiplication_x" ] ) )
    , ( "2728", ( "✨", "sparkles", [ "sparkles" ] ) )
    , ( "2733", ( "✳", "eight_spoked_asterisk", [ "eight_spoked_asterisk" ] ) )
    , ( "2734"
      , ( "✴"
        , "eight_pointed_black_star"
        , [ "eight_pointed_black_star" ]
        )
      )
    , ( "2744", ( "❄", "snowflake", [ "snowflake" ] ) )
    , ( "2747", ( "❇", "sparkle", [ "sparkle" ] ) )
    , ( "274c", ( "❌", "x", [ "x" ] ) )
    , ( "274e"
      , ( "❎"
        , "negative_squared_cross_mark"
        , [ "negative_squared_cross_mark" ]
        )
      )
    , ( "2753", ( "❓", "question", [ "question" ] ) )
    , ( "2754", ( "❔", "grey_question", [ "grey_question" ] ) )
    , ( "2755", ( "❕", "grey_exclamation", [ "grey_exclamation" ] ) )
    , ( "2757"
      , ( "❗"
        , "exclamation"
        , [ "exclamation"
          , "heavy_exclamation_mark"
          ]
        )
      )
    , ( "2764", ( "❤", "heart", [ "heart" ] ) )
    , ( "2795", ( "➕", "heavy_plus_sign", [ "heavy_plus_sign" ] ) )
    , ( "2796", ( "➖", "heavy_minus_sign", [ "heavy_minus_sign" ] ) )
    , ( "2797", ( "➗", "heavy_division_sign", [ "heavy_division_sign" ] ) )
    , ( "27a1", ( "➡", "arrow_right", [ "arrow_right" ] ) )
    , ( "27b0", ( "➰", "curly_loop", [ "curly_loop" ] ) )
    , ( "27bf", ( "➿", "loop", [ "loop" ] ) )
    , ( "2934", ( "⤴", "arrow_heading_up", [ "arrow_heading_up" ] ) )
    , ( "2935", ( "⤵", "arrow_heading_down", [ "arrow_heading_down" ] ) )
    , ( "2b05", ( "⬅", "arrow_left", [ "arrow_left" ] ) )
    , ( "2b06", ( "⬆", "arrow_up", [ "arrow_up" ] ) )
    , ( "2b07", ( "⬇", "arrow_down", [ "arrow_down" ] ) )
    , ( "2b1b", ( "⬛", "black_large_square", [ "black_large_square" ] ) )
    , ( "2b1c", ( "⬜", "white_large_square", [ "white_large_square" ] ) )
    , ( "2b50", ( "⭐", "star", [ "star" ] ) )
    , ( "2b55", ( "⭕", "o", [ "o" ] ) )
    , ( "3030", ( "〰", "wavy_dash", [ "wavy_dash" ] ) )
    , ( "303d", ( "〽", "part_alternation_mark", [ "part_alternation_mark" ] ) )
    , ( "3297", ( "㊗", "congratulations", [ "congratulations" ] ) )
    , ( "3299", ( "㊙", "secret", [ "secret" ] ) )
    , ( "1f004", ( "\xD83C\xDC04", "mahjong", [ "mahjong" ] ) )
    , ( "1f0cf", ( "\xD83C\xDCCF", "black_joker", [ "black_joker" ] ) )
    , ( "1f170", ( "\xD83C\xDD70", "a", [ "a" ] ) )
    , ( "1f171", ( "\xD83C\xDD71", "b", [ "b" ] ) )
    , ( "1f17e", ( "\xD83C\xDD7E", "o2", [ "o2" ] ) )
    , ( "1f17f", ( "\xD83C\xDD7F", "parking", [ "parking" ] ) )
    , ( "1f18e", ( "\xD83C\xDD8E", "ab", [ "ab" ] ) )
    , ( "1f191", ( "\xD83C\xDD91", "cl", [ "cl" ] ) )
    , ( "1f192", ( "\xD83C\xDD92", "cool", [ "cool" ] ) )
    ]
