use_bpm 119

with_fx :gverb, room: 35, mix: 0.8 do
  hs = synth :dsaw, note: 31, attack: 64, amp: 5, detune: 0.3, cutoff: 60, cutoff_slide: 64
  control hs, cutoff: 120
end

live_loop :bass do
  with_fx :slicer, phase: 0.25, wave: 0, mix: 1 do
    with_fx :gverb, room: 35, mix: 0.3 do
      ##| synth :dsaw, note: ring(24, 31, 26, 28).tick+7 , attack: 0, sustain: 4, release: 0, amp: 5, detune: 0.3, cutoff: 60
      ##| synth :dsaw, note: ring(24, 31, 26, 28).look+7+0, attack: 0, sustain: 4, release: 0, amp: 5, detune: 0.3, cutoff: 120
      sleep 4
    end
  end
end

in_thread do
  live_loop :synth do
    sleep 0.75
    with_fx :echo, phase: 0.5, decay: 4, mix: 0.5 do
      3.times do
        ##| synth :dsaw, note: choose([59+12,62+12,64,67,69])-5, attack: 0, release: 0.5, amp: 4, detune: 0.2
        with_fx :gverb, room: 20, mix: 0.5 do
          ##| synth :zawa, note: choose([59+12,62+12,64,67,69])-5, attack: 0, sustain: ring(3, 5).look, release: 0.5, amp: 1, range: 30, cutoff: 65
        end
      end
    end
    ##| sleep choose([1, 0.75, 0.75, 0.5, 0.5])
    sleep ring(5, 3).tick-0.75
    ##| sleep 8
  end
end

in_thread do
  sync :bass
  live_loop :synth2 do
    use_synth :beep
    with_fx :echo, phase: 0.5, decay: 4, mix: 0.5 do
      ##| play choose([74,76,79,81])-5, attack: 0, release: 0.5, amp: 3
    end
    sleep choose([3, 1.5, 1, 0.5,0.5])
  end
end

in_thread do
  sync :bass
  live_loop :synth3 do
    use_synth :dsaw
    with_fx :gverb, room: 35, mix: 0.5 do
      with_fx :slicer, phase: 0.25, wave: 1, mix: 1 do
        
        ##| s = synth :dsaw, note: 59+24, note_slide: 16, attack: 32, release: 32, amp: 1, detune: 0.3
        sleep 32
        ##| control s, note: :b6
        sleep 32
      end
    end
  end
end

in_thread do
  live_loop :beat do
    with_fx :echo, phase: 0.75, decay: 1, mix: 1 do
      ##| sample :bd_haus, amp: 14, cutoff: 90
    end
    sleep 1
    ##| sample :sn_dub, amp: 12, rate: 0.6, finish: 0.35
    sleep 0.5
    with_fx :gverb, room: 34, tail_level: 0.9, release: 4, mix: 0.6, damp: 0 do
      ##| sample :elec_tick, amp: ring(8,0).tick(:ii), rate: 2
    end
    sleep 0.5
  end
end

in_thread do
  sync :beat
  live_loop :tickas do
    with_fx :reverb, room: 0.3, mix: 0.4 do
      4.times do
        ##| synth :cnoise, release: rrand(0.15,0.25), amp: 3, env_curve: 3, res: 0.33, cutoff: rrand(110,115)
        ##| synth :gnoise, release: rrand(0.15,0.25), amp: 3, env_curve: 2, res: 0.43, cutoff: rrand(110,115)
        ##| synth :pnoise, release: rrand(0.15,0.25), amp: 4, env_curve: 2, res: 0.63, cutoff: rrand(110,115)
        sleep 0.25
      end
    end
  end
end

