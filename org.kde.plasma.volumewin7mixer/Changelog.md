## v22 - December 26 2017

* Reimplement mouse wheel mute, wheel to control volume which was accidentally removed in the v21 refactor.

## v21 - December 6 2017

* Add (proper) support for use in the system tray. Will open in it's own popup window.
* Unchecking echo cancellation will also uncheck the "list to device" if listening to the echo cancelled stream.

## v20 - November 11 2017

* Use the same shape for the slider handle as Windows 7.
* Automatically close popup when selecting default device (can disable in config).
* Implement toggle for echo cancelling and microphone loopback.
* Show checkmark next to the default speaker/mic when 2+ devices.
* Hide virtual streams by default (configurable).
* Scale panel icon to the same maximum size as the other icons in Plasma 5.10.
* Begin packaging translations in the *.plasmoid (requires KDE Frameworks v37 to work). Reused some translations from the default volume and mediacontroller widgets.

## v19 - March 29 2017

* Can now use keyboard navigation to select a stream.
** Left/Right: Select speaker/mic/app/etc.
** Up/Down: Increase/decrease selected volume (by same amount as volume keys).
** M: Mute/unmute selected stream.
** 0-9: Set volume to 0%-90%
** Enter: If a mic/speaker is selected, make it the default device.
* Selected stream will have a pulsating outline. Current default speaker is selected by default. Outline is hidden if you open the mixer with the mouse, but shortcuts will still work.
* Global shortcut will now toggle the popup.
* Fix the blue on gray theme using the color scheme rather than hardcoded colours.
* Fix toggling the volume boost, snapping the value to just over 100% causing it to remain in "boosted" state (with a max of 150%).
* Drag to 1% intervals when volume boosted (instead of 1.5%, 3%, 4.5%, etc).
* Possibly fix a binding loop when checking if you can seek through a song.

## v18 - March 23 2017

* Raised minimum requirements to Plasma 5.8
* [upstream] Add volume feedback
* Show current version in the config.

## v17 - March 21 2017

* Fix for the media slider starting at the length of the previous song. Thanks davidedmundson.
* Get rid of the 1px outline on the volume slider groove.
* The new volume slider layout will now be coloured based on the desktop theme.
* The previous volume slider theme/colouring (light blue on gray) can be selected in the settings.
* Add time elapsed & time left next to the song's progressbar like the default media controller widget. Both are toggleable, along with the option to show the total duration of the song.

## v16 - March 15 2017

* Make the icon+label into a button that opens the context menu.
* You can now drag a microphone onto a recording app to change it's input. I only tested this with SimpleStreamRecorder and it added recorded both the desktop output and the microphone output at the same time rather than switching from one to the other.
* Overlay 'emblem-unlocked' when app isn't using the default speaker/mic. I may change the icon if a better one is recommended.
* Fuss with the volume slider triangle. It will now be thicker when volume is boosted.
* Make the group title (Apps/Mics/Speakers) into a button. It will probably be used for filtering unwanted streams in the future, but for now it just lists the items in it's group.
* Fix the label/icon when using the echo-cancel pulseaudio module.

## v15 - March 14 2017

* Reskin the volume sliders to be triangular similar to kmix/win7.
* Allow placing the media controller at the top of the popup.
* Make the media controller slider taller.
* Scale the widget based on the DPI.
* Remove context menu link to the kcm like the default widget. It's still availble with "Audio Volume Settings..." > "Audio Volume".
* Map speakers with names starting with "bluez_sink." to a bluetooth icon.
* Add a properties dialog listing all the values for a speaker/app/microphone.
* Use 'google-chrome' icon for "chrome (deleted)" streams.
* Use the "microphone volume/mute" icons from the OSD for a microphones mute button.
* Add toggle for showing the OSD.
* [upstream] Mute volume when the slider is at 0%.
* When using the mediakeys, jump to 100%/0% if less than 1 step away.
* Compare the port key for "headphone" instead of the localized "Headphone" when deciding on the icon.
* Fix the mute button icon's hover effects.
* Fix all strings for localization with i18n.
* Russian translations are available in RosaLinux's ABF: https://abf.rosalinux.ru/victorr2007/plasma5-applet-volumewin7mixer
* Use doubles instead of ints for the mpris2/media controller's position/duration which are in microseconds since it was overflowing on songs/movies longer than 33 minutes.

## v14 - September 7 2016

* Show current song in tooltip.
* Use description instead of the internal name on mics/speakers.
* Use the video-television icon for the hdmi speaker.

## v13 - August 26 2016

* Add media controls based on the default widget + mediacontrollercompact. You can disable it in the settings.
* Icons now follow the theme color.

## v12 - August 24 2016

* Use heaphones icon when port is set to Headphones.
* Add context menu to quickly: Change the default speaker/microphone, Volume Boost the steam, Change the port (eg: headphones).
* Mute button now mutes instead of volume boosts.
* Fix drag and drop device selection.
* Show output device id in app tooltip.
* Add group for "Recording Apps" (eg: VirtualBox).
* Add standard pin to keep mixer open.
* Optionally move all app streams to the newly selected default device.

## v11 - July 7 2016

* This requires KDE 5.7+
* Bump version ahead of the AUR package which bumped versions before I started versioning.
* Merged from upstream (plasma-pa):
  * Use the default speaker volume in the panel icon.
  * Media keys only control the default speaker.
  * Volume Boost to 150%. Can be toggled per app by clicking the speaker icon (formerly the mute button). I will be moving that button to a context menu as soon as I figure out how. Example: https://streamable.com/oqt4
  * Don't disable the slider when muted, alowing the user to change the volume without unmuting.
  * Handle Microphone shortcuts.

## v2 - May 13 2016

* Supports KDE 5.5 and KDE 5.6 (Maybe 5.4?)
* Custom vertical volume slider.
* Configurable number of steps to reach 100% volume with media keys.
* Add links to alsamixer and pavucontrol in context menu.
* Merged from upstram (plasma-pa):
  * Drag and drop to move app output to a specific speaker.

## v1 - ?

* Vertical volume sliders.
