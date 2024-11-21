# Lua Scripts for mpv

## Installation

TODO

## Scripts

### [excerpt.lua](./excerpt.lua)

Create excerpts from a video
using mpv's encoding feature.

Attempts to preserve settings
of the current mpv instance
for encoding
(like selected edition,
selected video/audio/subtitle track,
audio or subtitle delay).

Create a start mark with <kbd>Alt+i</kbd>,
an end mark with <kbd>Alt+o</kbd>
and start the encode with <kbd>Alt+x</kbd>.


### [pitchcontrol.lua](./pitchcontrol.lua)

Control audio pitch in semitone steps.
<kbd>Alt+P</kbd> increases,
<kbd>Alt+p</kbd> decreases
by one semitone each.
