# README for Music_Maker.rb
### Listen while you read!
  Theres a sample of some music generated in this repository called "Music_Maker_Example1.wav", if you want the perfect background music to accompany this README.
## IDEA

The idea behind this project was to build a system using Sonic Pi that was able to generate a random 4 bar chord progression and to also have a melody generator that essentially comps off the chord progression. It plays notes with varying durations and from a scale based on the root of the chord that the chord progression is currently at.  

## SYSTEM

The chord progression is made by generating a list of 2-6 chords.  Then I use a simple algorithm to essentially assign random intervals of time to each chord, it returns this as a list as well.  I choose minor chords and minor scales, because I personally like the sounds that come from it, but they can be randomized as well and sonic pi has a large variety of chords and scales to choose from.   But after building this chord progression, it plays the chords with the given intervals, and at the same time notes are being played with random durations, but the keys change as the new chords are played.  The result is it generating interesting phrasings and ideas.  I really enjoy the sounds that come out of it and I think that it is a great creative tool that artists can use to find inspiration.  The music that the system generates is almost completely non-idiosyncratic. The only things that you can argue to be it’s limitations towards idiosyncracy are that it sticks to the scale, so there’s not any experimenting going on their with respect to tone (besides some long notes that carry through as the chords change), but nonetheless it generates ideas that are completely novel, something that a human would struggle to do.

## HOW TO USE

If you want to experiment with the system, you need to use the Sonic Pi software and open the file with their IDE.  All you do is hit play and it will start generating music!  If you want to hear the different chord progressions and melodies it's capable of generating, just change the seed number at the top to some other integer. There’s a lot that can be done with this (like randomizing the types of chords and scales, or playing with note duration and adding in rests) but it does a stellar job already at creating interesting chord progressions while also generating interesting phrasings with the melody generator (which was my own goal).
