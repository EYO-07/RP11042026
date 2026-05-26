# BEGIN

# =================================================================================



# =================================================================================
# keyboard library

# Inventory [ keyboard ] { python 3 }
# SYNTAX // SHORTDESCRIPTION
# keyboard.is_pressed(str_keyname) // check if a key is pressed
# keyboard.add_hotkey(hotkey, callback, suppress=False) // bind function to key
# keyboard.press_and_release(hotkey) // simulate tap (e.g., 'ctrl+c')
# keyboard.write(text, delay=0) // type string
# keyboard.wait(str_keyname) // block until key is pressed
# keyboard.hook(callback, suppress=False) // listen to all events
# keyboard.block_key(str_keyname) // stop key from reaching OS
# keyboard.unblock_key(str_keyname) // restore blocked key
# keyboard.remove_hotkey(hotkey) // remove specific binding
# keyboard.unhook_all() // remove all hooks/listeners

# Inventory [ keynames ] { python 3, keyboard library }
# SYNTAX // SHORTDESCRIPTION
# up, down, left, right // arrow keys
# ctrl, shift, alt, windows // modifiers
# space, enter, tab, backspace, esc // common actions
# f1 ... f12 // function keys
# page up, page down, home, end // navigation
# caps lock, num lock, scroll lock // toggle locks
# print screen, insert, delete // system keys
# num 0 ... num 9 // numeric keypad
# volume up, volume down, mute // media control
# left shift, right shift // side-specific keys


# END 

