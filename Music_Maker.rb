set :global_temp, 95
set :possible_chords, (ring :C4, :Cb4, :Cs4, :D4, :Db4, :Ds4, :E4, :Eb4, :Es4, :F4, :Fb4, :Fs4, :G4, :Gb4, :Gs4, :A4, :Ab4, :As4, :B4, :Bb4, :Bs4)
set :possible_intervals, [2, 2, 2, 2, 1, 3, 3, 4, 4, 4, 4, 6, 6, 8, 8]
use_random_seed 41


#41 makes good music

define :get_chords do
  num = rrand_i(2, 6)
  set :num_chords, num
  set :chord_progression, get[:possible_chords].shuffle.take(num)
end

define :get_intervals do
  beats_left = 16
  counter = 0
  num_chords = get[:num_chords]
  first_interval = get[:possible_intervals][rrand_i(0, 14)]
  intervals = [first_interval]
  counter += 1
  beats_left = beats_left - first_interval
  
  while ((num_chords - counter) > 0)
    
    if ((num_chords - counter) == 1)
      intervals << beats_left
      set :intervals, intervals.ring
      counter = counter + 1
      
    else
      next_interval = get[:possible_intervals][rrand_i(0,14)]
      if (next_interval < (num_chords - counter))
        counter = counter + 1
        beats_left = beats_left - next_interval
        intervals << next_interval
      end
    end
  end
end


define :get_beat do |numBeats|
  proportion = 60.0 / get[:global_temp]
  numBeats = numBeats * proportion
end



define :play_note do |root|
  interval = choose([1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 4, 4, 6, 8])
  play choose(chord(root, :minor)), release: interval*0.9
  sleep interval
end

define :chord_player do |root, release, interval|
  play chord(root, :minor), release: release
  sleep interval
  
end

in_thread do
  loop do
    sample :drum_heavy_kick
    numBeats = 1
    numBeats = get_beat numBeats
    sleep numBeats
  end
end

counter = 0
get_chords
get_intervals
in_thread do
  loop do
    duration = get_beat get[:intervals][counter]
    set :root, get[:chord_progression][counter]
    chord_player get[:root], duration*0.95, duration
    counter = counter + 1
  end
end

loop do
  play_note get[:root]
end






