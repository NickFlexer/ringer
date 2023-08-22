# ringer

Lua implementation of ring buffer

## Install

Put ringer in your project and call it via `require`

## Example

```lua
local Ringer = require "ringer"

local ring_buffer = Ringer({"a", "b", "c", "d"})

for i = 1, 9 do
    local data = ring_buffer:next()
    io.write(tostring(i) .. " = " .. data, " ")
end

-- print: 1 = a 2 = b 3 = c 4 = d 5 = a 6 = b 7 = c 8 = d 9 = a
```

## Documentation

**`Ringer([data])`**

Create new `ringer` object

Arguments:

* `[optional]` `data` `(table)` - The data to fill the buffer

Returns:

* `Ringer` `(table)` - The `ringer` object

---

**`:insert(item)`**

Add new item to buffer

Arguments:

* `item` `(any)` - The data to fill the buffer

---

**`:remove(item)`**

Remove concrete item from buffer

Arguments:

* `item` `(any)` - The data for deletion

If item does not exist, `ringer` raise error

`remove(): item  not available`

---

**`:get()`**

Get buffer head

Returns:

* `(any)` - Current head object

If buffer is empty, ringer raise error:

`get(): buffer is empty!`

---

**`:next()`**

Return current head object and move the head to the next element

Returns:

* `(any)` - Current head object

If buffer is empty, ringer raise error:

`next(): buffer is empty!`

---

**`:is_empty()`**

Check if buffer is empty

Returns:

* `(boolean)` - Return `true` if buffer is empty

---

**`:is_exist(item)`**

checks if the `item` is already in the buffer

Arguments:

* `item` `(any)` - The data for deletion

Returns:

* `(boolean)` - Return `true` if item is exist in bufer

---

Also, ringer implements some metamethods:

* `#ringer` - return lenght of buffer
* `print(ringer)` - pretty print buffer content like `[a, b, c, d]`

## Testing

Tests defined with `busted` test farmework. To run the suite, install busted and simply execute `busted` in the ringer directory.
