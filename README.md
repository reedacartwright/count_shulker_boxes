# CSB: Count Shulker Boxes

Measure production of Minecraft farms

## Summary

CSB is a behavior pack for Minecraft Bedrock Edition that allows players to
measure the production of their farms. CSB measures the average time it takes
for a farm to fill a shulker box and uses that to calculate the number of drops
a farm generates per hour.

## Quick Start

In world settings, activate the CSB behavior pack and enable cheats. Then issue
the following command from the console to initialize CSB's scoreboards.
```
/function csb/setup
```

Add a shulker box loader to capture the output of your farm. Attach an impulse
command block to the loader such that it gets triggered when a new, empty
shulker box is dispensed. This command block should run
```
/function csb/sig_new_box
```
whenever it receives a redstone signal indicating that a new, empty box was
dispensed.

Next turn your farm on and issue the following command to start tracking drops
```
/function csb/start
```

When you are done tracking drops, you can ask CSB to stop:
```
/function csb/stop
```

And if you need to reset your statistics to run another test, you can use the
following command:
```
/function csb/reset
```

## Statistics

CSB tracks 14 statistics. Most statistics are not tracked until the first time
`csb/sig_new_box` is called. The time between when `csb/start` is called and
when `csb/sig_new_box` is first called is the "burn in" time and is used to
allow a farm to get up to speed and handle any situations where the initial
shulker box might be partially full. Because `csb/sig_new_box` is triggered
on a fresh shulker box, CSB's statistics will not be affected by partially
full boxes.

* TimerTicks: How long in ticks since CSB was started.
* TimerMinutes: How long in minutes since CSB was started.
* TimeFirstSig: The time in ticks when `csb/sig_new_box` was first called.
* TimeLastSig: The time in ticks when `csb/sig_new_box` was last called.
* TimeTotal: The difference between TimeLastSig and TimeFirstSig.
* NumBoxes: The number of boxes that have been filled between TimeFirstSig and
  TimeLastSig.
* DropRate: An estimate of the number of items/hour that the farm produces.
Assumes that a shulker box can hold 1728 items (27 stacks of 64).
* FillTimeAvg: Average number of ticks for the farm to fill a shulker box.
* FillTimeVar: The variance of the time it takes to fill a shulker box.
* FillTime1: The time it took to fill the most recent shulker box
* FillTime2 etc.: Similar to TimeSpan1, but for earlier boxes.

## Command Functions

### `csb/setup` and `csb/reset` 

These functions create/reset CSB's scoreboards.

### `csb/start` and `csb/stop`

These function turn on and off CSB.

### `csb/unload`

This function removes CSB's scoreboards.

### `csb/sig_new_box`

This function signals when a new, empty shulker box has been dispensed into
the shulker loader. It also updates the statistics that CSB tracks.
