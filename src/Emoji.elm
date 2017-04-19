module Emoji
    exposing
        ( Emoji
        , Emojis
        , emojis
        , toList
        , search
        , string
        )

{-| A searchable emoji database

This is a simple Elm package that collects all of the emoji into a module and
provides a means of searching the database for a given emoji.

There's an example emoji picker app that uses it in [the repository's `example`
directory.](https://github.com/dailydrip/elm-emoji/tree/master/example)

# Types
@docs Emoji, Emojis

# Functions
@docs string, search, toList, emojis
-}

import Dict exposing (Dict)


{-| An opaque type for an Emoji
-}
type Emoji
    = Emoji String String (List String)


{-| An opaque type for the Emoji database
-}
type Emojis
    = Emojis (Dict String Emoji)


{-| Get the string for an emoji
-}
string : Emoji -> String
string (Emoji emojiString _ _) =
    emojiString


{-| Turn an `Emojis` into a list of `( key, emoji )`
-}
toList : Emojis -> List ( String, Emoji )
toList (Emojis dict) =
    Dict.toList dict


{-| Test if an emoji contains a search string in any of its common names
-}
emojiContains : String -> String -> Emoji -> Bool
emojiContains prefix key (Emoji _ _ commonNames) =
    commonNames
        |> List.any (String.contains prefix)


{-| Search for an emoji by common name part
-}
search : String -> Emojis -> Emojis
search prefix (Emojis dict) =
    dict
        |> Dict.filter (emojiContains prefix)
        |> Emojis


{-| All of the emojis
-}
emojis : Emojis
emojis =
    let
        dict1 =
            emojiList1
                |> Dict.fromList

        dict2 =
            emojiList2
                |> Dict.fromList

        dict3 =
            emojiList3
                |> Dict.fromList
    in
        dict1
            |> Dict.union dict2
            |> Dict.union dict3
            |> Emojis


emojiList1 : List ( String, Emoji )
emojiList1 =
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
        |> List.map (\( k, ( a, b, c ) ) -> ( k, Emoji a b c ))


emojiList2 : List ( String, Emoji )
emojiList2 =
    [ ( "1f193", ( "\xD83C\xDD93", "free", [ "free" ] ) )
    , ( "1f194", ( "\xD83C\xDD94", "id", [ "id" ] ) )
    , ( "1f195", ( "\xD83C\xDD95", "new", [ "new" ] ) )
    , ( "1f196", ( "\xD83C\xDD96", "ng", [ "ng" ] ) )
    , ( "1f197", ( "\xD83C\xDD97", "ok", [ "ok" ] ) )
    , ( "1f198", ( "\xD83C\xDD98", "sos", [ "sos" ] ) )
    , ( "1f199", ( "\xD83C\xDD99", "up", [ "up" ] ) )
    , ( "1f19a", ( "\xD83C\xDD9A", "vs", [ "vs" ] ) )
    , ( "1f201", ( "\xD83C\xDE01", "koko", [ "koko" ] ) )
    , ( "1f202", ( "\xD83C\xDE02", "sa", [ "sa" ] ) )
    , ( "1f21a", ( "\xD83C\xDE1A", "u7121", [ "u7121" ] ) )
    , ( "1f22f", ( "\xD83C\xDE2F", "u6307", [ "u6307" ] ) )
    , ( "1f232", ( "\xD83C\xDE32", "u7981", [ "u7981" ] ) )
    , ( "1f233", ( "\xD83C\xDE33", "u7a7a", [ "u7a7a" ] ) )
    , ( "1f234", ( "\xD83C\xDE34", "u5408", [ "u5408" ] ) )
    , ( "1f235", ( "\xD83C\xDE35", "u6e80", [ "u6e80" ] ) )
    , ( "1f236", ( "\xD83C\xDE36", "u6709", [ "u6709" ] ) )
    , ( "1f237", ( "\xD83C\xDE37", "u6708", [ "u6708" ] ) )
    , ( "1f238", ( "\xD83C\xDE38", "u7533", [ "u7533" ] ) )
    , ( "1f239", ( "\xD83C\xDE39", "u5272", [ "u5272" ] ) )
    , ( "1f23a", ( "\xD83C\xDE3A", "u55b6", [ "u55b6" ] ) )
    , ( "1f250"
      , ( "\xD83C\xDE50"
        , "ideograph_advantage"
        , [ "ideograph_advantage" ]
        )
      )
    , ( "1f251", ( "\xD83C\xDE51", "accept", [ "accept" ] ) )
    , ( "1f300", ( "\xD83C\xDF00", "cyclone", [ "cyclone" ] ) )
    , ( "1f301", ( "\xD83C\xDF01", "foggy", [ "foggy" ] ) )
    , ( "1f302", ( "\xD83C\xDF02", "closed_umbrella", [ "closed_umbrella" ] ) )
    , ( "1f303", ( "\xD83C\xDF03", "night_with_stars", [ "night_with_stars" ] ) )
    , ( "1f304"
      , ( "\xD83C\xDF04"
        , "sunrise_over_mountains"
        , [ "sunrise_over_mountains" ]
        )
      )
    , ( "1f305", ( "\xD83C\xDF05", "sunrise", [ "sunrise" ] ) )
    , ( "1f306", ( "\xD83C\xDF06", "city_sunset", [ "city_sunset" ] ) )
    , ( "1f307", ( "\xD83C\xDF07", "city_sunrise", [ "city_sunrise" ] ) )
    , ( "1f308", ( "\xD83C\xDF08", "rainbow", [ "rainbow" ] ) )
    , ( "1f309", ( "\xD83C\xDF09", "bridge_at_night", [ "bridge_at_night" ] ) )
    , ( "1f30a", ( "\xD83C\xDF0A", "ocean", [ "ocean" ] ) )
    , ( "1f30b", ( "\xD83C\xDF0B", "volcano", [ "volcano" ] ) )
    , ( "1f30c", ( "\xD83C\xDF0C", "milky_way", [ "milky_way" ] ) )
    , ( "1f30d", ( "\xD83C\xDF0D", "earth_africa", [ "earth_africa" ] ) )
    , ( "1f30e", ( "\xD83C\xDF0E", "earth_americas", [ "earth_americas" ] ) )
    , ( "1f30f", ( "\xD83C\xDF0F", "earth_asia", [ "earth_asia" ] ) )
    , ( "1f310"
      , ( "\xD83C\xDF10"
        , "globe_with_meridians"
        , [ "globe_with_meridians" ]
        )
      )
    , ( "1f311", ( "\xD83C\xDF11", "new_moon", [ "new_moon" ] ) )
    , ( "1f312"
      , ( "\xD83C\xDF12"
        , "waxing_crescent_moon"
        , [ "waxing_crescent_moon" ]
        )
      )
    , ( "1f313", ( "\xD83C\xDF13", "first_quarter_moon", [ "first_quarter_moon" ] ) )
    , ( "1f314", ( "\xD83C\xDF14", "moon", [ "moon", "waxing_gibbous_moon" ] ) )
    , ( "1f315", ( "\xD83C\xDF15", "full_moon", [ "full_moon" ] ) )
    , ( "1f316"
      , ( "\xD83C\xDF16"
        , "waning_gibbous_moon"
        , [ "waning_gibbous_moon" ]
        )
      )
    , ( "1f317", ( "\xD83C\xDF17", "last_quarter_moon", [ "last_quarter_moon" ] ) )
    , ( "1f318"
      , ( "\xD83C\xDF18"
        , "waning_crescent_moon"
        , [ "waning_crescent_moon" ]
        )
      )
    , ( "1f319", ( "\xD83C\xDF19", "crescent_moon", [ "crescent_moon" ] ) )
    , ( "1f320", ( "\xD83C\xDF20", "stars", [ "stars" ] ) )
    , ( "1f31a", ( "\xD83C\xDF1A", "new_moon_with_face", [ "new_moon_with_face" ] ) )
    , ( "1f31b"
      , ( "\xD83C\xDF1B"
        , "first_quarter_moon_with_face"
        , [ "first_quarter_moon_with_face" ]
        )
      )
    , ( "1f31c"
      , ( "\xD83C\xDF1C"
        , "last_quarter_moon_with_face"
        , [ "last_quarter_moon_with_face" ]
        )
      )
    , ( "1f31d"
      , ( "\xD83C\xDF1D"
        , "full_moon_with_face"
        , [ "full_moon_with_face" ]
        )
      )
    , ( "1f31e", ( "\xD83C\xDF1E", "sun_with_face", [ "sun_with_face" ] ) )
    , ( "1f31f", ( "\xD83C\xDF1F", "star2", [ "star2" ] ) )
    , ( "1f330", ( "\xD83C\xDF30", "chestnut", [ "chestnut" ] ) )
    , ( "1f331", ( "\xD83C\xDF31", "seedling", [ "seedling" ] ) )
    , ( "1f332", ( "\xD83C\xDF32", "evergreen_tree", [ "evergreen_tree" ] ) )
    , ( "1f333", ( "\xD83C\xDF33", "deciduous_tree", [ "deciduous_tree" ] ) )
    , ( "1f334", ( "\xD83C\xDF34", "palm_tree", [ "palm_tree" ] ) )
    , ( "1f335", ( "\xD83C\xDF35", "cactus", [ "cactus" ] ) )
    , ( "1f337", ( "\xD83C\xDF37", "tulip", [ "tulip" ] ) )
    , ( "1f338", ( "\xD83C\xDF38", "cherry_blossom", [ "cherry_blossom" ] ) )
    , ( "1f339", ( "\xD83C\xDF39", "rose", [ "rose" ] ) )
    , ( "1f33a", ( "\xD83C\xDF3A", "hibiscus", [ "hibiscus" ] ) )
    , ( "1f33b", ( "\xD83C\xDF3B", "sunflower", [ "sunflower" ] ) )
    , ( "1f33c", ( "\xD83C\xDF3C", "blossom", [ "blossom" ] ) )
    , ( "1f33d", ( "\xD83C\xDF3D", "corn", [ "corn" ] ) )
    , ( "1f33e", ( "\xD83C\xDF3E", "ear_of_rice", [ "ear_of_rice" ] ) )
    , ( "1f33f", ( "\xD83C\xDF3F", "herb", [ "herb" ] ) )
    , ( "1f340", ( "\xD83C\xDF40", "four_leaf_clover", [ "four_leaf_clover" ] ) )
    , ( "1f341", ( "\xD83C\xDF41", "maple_leaf", [ "maple_leaf" ] ) )
    , ( "1f342", ( "\xD83C\xDF42", "fallen_leaf", [ "fallen_leaf" ] ) )
    , ( "1f343", ( "\xD83C\xDF43", "leaves", [ "leaves" ] ) )
    , ( "1f344", ( "\xD83C\xDF44", "mushroom", [ "mushroom" ] ) )
    , ( "1f345", ( "\xD83C\xDF45", "tomato", [ "tomato" ] ) )
    , ( "1f346", ( "\xD83C\xDF46", "eggplant", [ "eggplant" ] ) )
    , ( "1f347", ( "\xD83C\xDF47", "grapes", [ "grapes" ] ) )
    , ( "1f348", ( "\xD83C\xDF48", "melon", [ "melon" ] ) )
    , ( "1f349", ( "\xD83C\xDF49", "watermelon", [ "watermelon" ] ) )
    , ( "1f34a", ( "\xD83C\xDF4A", "tangerine", [ "tangerine" ] ) )
    , ( "1f34b", ( "\xD83C\xDF4B", "lemon", [ "lemon" ] ) )
    , ( "1f34c", ( "\xD83C\xDF4C", "banana", [ "banana" ] ) )
    , ( "1f34d", ( "\xD83C\xDF4D", "pineapple", [ "pineapple" ] ) )
    , ( "1f34e", ( "\xD83C\xDF4E", "apple", [ "apple" ] ) )
    , ( "1f34f", ( "\xD83C\xDF4F", "green_apple", [ "green_apple" ] ) )
    , ( "1f350", ( "\xD83C\xDF50", "pear", [ "pear" ] ) )
    , ( "1f351", ( "\xD83C\xDF51", "peach", [ "peach" ] ) )
    , ( "1f352", ( "\xD83C\xDF52", "cherries", [ "cherries" ] ) )
    , ( "1f353", ( "\xD83C\xDF53", "strawberry", [ "strawberry" ] ) )
    , ( "1f354", ( "\xD83C\xDF54", "hamburger", [ "hamburger" ] ) )
    , ( "1f355", ( "\xD83C\xDF55", "pizza", [ "pizza" ] ) )
    , ( "1f356", ( "\xD83C\xDF56", "meat_on_bone", [ "meat_on_bone" ] ) )
    , ( "1f357", ( "\xD83C\xDF57", "poultry_leg", [ "poultry_leg" ] ) )
    , ( "1f358", ( "\xD83C\xDF58", "rice_cracker", [ "rice_cracker" ] ) )
    , ( "1f359", ( "\xD83C\xDF59", "rice_ball", [ "rice_ball" ] ) )
    , ( "1f35a", ( "\xD83C\xDF5A", "rice", [ "rice" ] ) )
    , ( "1f35b", ( "\xD83C\xDF5B", "curry", [ "curry" ] ) )
    , ( "1f35c", ( "\xD83C\xDF5C", "ramen", [ "ramen" ] ) )
    , ( "1f35d", ( "\xD83C\xDF5D", "spaghetti", [ "spaghetti" ] ) )
    , ( "1f35e", ( "\xD83C\xDF5E", "bread", [ "bread" ] ) )
    , ( "1f35f", ( "\xD83C\xDF5F", "fries", [ "fries" ] ) )
    , ( "1f360", ( "\xD83C\xDF60", "sweet_potato", [ "sweet_potato" ] ) )
    , ( "1f361", ( "\xD83C\xDF61", "dango", [ "dango" ] ) )
    , ( "1f362", ( "\xD83C\xDF62", "oden", [ "oden" ] ) )
    , ( "1f363", ( "\xD83C\xDF63", "sushi", [ "sushi" ] ) )
    , ( "1f364", ( "\xD83C\xDF64", "fried_shrimp", [ "fried_shrimp" ] ) )
    , ( "1f365", ( "\xD83C\xDF65", "fish_cake", [ "fish_cake" ] ) )
    , ( "1f366", ( "\xD83C\xDF66", "icecream", [ "icecream" ] ) )
    , ( "1f367", ( "\xD83C\xDF67", "shaved_ice", [ "shaved_ice" ] ) )
    , ( "1f368", ( "\xD83C\xDF68", "ice_cream", [ "ice_cream" ] ) )
    , ( "1f369", ( "\xD83C\xDF69", "doughnut", [ "doughnut" ] ) )
    , ( "1f36a", ( "\xD83C\xDF6A", "cookie", [ "cookie" ] ) )
    , ( "1f36b", ( "\xD83C\xDF6B", "chocolate_bar", [ "chocolate_bar" ] ) )
    , ( "1f36c", ( "\xD83C\xDF6C", "candy", [ "candy" ] ) )
    , ( "1f36d", ( "\xD83C\xDF6D", "lollipop", [ "lollipop" ] ) )
    ]
        |> List.map (\( k, ( a, b, c ) ) -> ( k, Emoji a b c ))


emojiList3 : List ( String, Emoji )
emojiList3 =
    [ ( "1f36e", ( "\xD83C\xDF6E", "custard", [ "custard" ] ) )
    , ( "1f36f", ( "\xD83C\xDF6F", "honey_pot", [ "honey_pot" ] ) )
    , ( "1f370", ( "\xD83C\xDF70", "cake", [ "cake" ] ) )
    , ( "1f371", ( "\xD83C\xDF71", "bento", [ "bento" ] ) )
    , ( "1f372", ( "\xD83C\xDF72", "stew", [ "stew" ] ) )
    , ( "1f373", ( "\xD83C\xDF73", "egg", [ "egg" ] ) )
    , ( "1f374", ( "\xD83C\xDF74", "fork_and_knife", [ "fork_and_knife" ] ) )
    , ( "1f375", ( "\xD83C\xDF75", "tea", [ "tea" ] ) )
    , ( "1f376", ( "\xD83C\xDF76", "sake", [ "sake" ] ) )
    , ( "1f377", ( "\xD83C\xDF77", "wine_glass", [ "wine_glass" ] ) )
    , ( "1f378", ( "\xD83C\xDF78", "cocktail", [ "cocktail" ] ) )
    , ( "1f379", ( "\xD83C\xDF79", "tropical_drink", [ "tropical_drink" ] ) )
    , ( "1f37a", ( "\xD83C\xDF7A", "beer", [ "beer" ] ) )
    , ( "1f37b", ( "\xD83C\xDF7B", "beers", [ "beers" ] ) )
    , ( "1f37c", ( "\xD83C\xDF7C", "baby_bottle", [ "baby_bottle" ] ) )
    , ( "1f380", ( "\xD83C\xDF80", "ribbon", [ "ribbon" ] ) )
    , ( "1f381", ( "\xD83C\xDF81", "gift", [ "gift" ] ) )
    , ( "1f382", ( "\xD83C\xDF82", "birthday", [ "birthday" ] ) )
    , ( "1f383", ( "\xD83C\xDF83", "jack_o_lantern", [ "jack_o_lantern" ] ) )
    , ( "1f384", ( "\xD83C\xDF84", "christmas_tree", [ "christmas_tree" ] ) )
    , ( "1f385", ( "\xD83C\xDF85", "santa", [ "santa" ] ) )
    ]
        |> List.map (\( k, ( a, b, c ) ) -> ( k, Emoji a b c ))
