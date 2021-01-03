# 1h-pong

## Overview

I set a 1h clock to design and implement a pong variant. I used Godot to code this up. Player 1 moves with W/S and Player 2 moves with Up/Down

## Problems I Encountered

* I lost a lot of time debugging positioning because my wrapping child scenes' positions weren't centered around my sprites/collision shapes
* It was difficult to iterate on the bounce physics. I didn't have time to do a bunch of calculations so I tried trial and error with dampening constants

## Lessons Learned

* Keeping child scenes centered made finding the midpoint of the paddle trivial
