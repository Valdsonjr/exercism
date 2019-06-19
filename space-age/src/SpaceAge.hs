module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn Mercury = earthYears 0.2408467
ageOn Venus   = earthYears 0.61519726
ageOn Earth   = earthYears 1
ageOn Mars    = earthYears 1.8808151
ageOn Jupiter = earthYears 11.862615
ageOn Saturn  = earthYears 29.447498
ageOn Uranus  = earthYears 84.016846
ageOn Neptune = earthYears 164.79132

earthYears :: Float -> Float -> Float
earthYears y x = x / (31557600 * y) 
