module TfnTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

import Tfn

valid9 : List String
valid9 = [
    "907..974..668",
    "555-000-555",
    "   459-599-230   ",
    "1124-740-82",
    "565//051//603"
  ]

valid8 : List String
valid8 = [
    "81.854.402",
    "37-118-629",
    "37:118:660",
    "37118705",
    "38-593-474",
    "38-593-519",
    "85-655-734",
    "85-655-797",
    "85-655-810",
    "37-118-655"
  ]

invalidTfns : List String
invalidTfns = [
    "123-456-789",
    "",
    "--111",
    "____",
    "12-345-678"
  ]

suite : Test
suite =
    describe "Only digits test"
        [ test "invalid tfns" <|
            \() ->
                Expect.equal (List.map Tfn.isValid invalidTfns) (List.map (\_->False) invalidTfns)
        
        , test "valid 9 digit tfns" <|
            \() ->
                Expect.equal (List.map Tfn.isValid valid9) (List.map (\_->True) valid9)

        , test "valid 8 digit tfns" <|
            \() ->
                Expect.equal (List.map Tfn.isValid valid8) (List.map (\_->True) valid8)
        ]
