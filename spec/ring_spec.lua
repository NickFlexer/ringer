---
-- ring_spec.lua


describe("Ringer", function ()

    local Ringer = require "ringer"

    describe("initialize", function ()
        it("call new()", function ()
            local r = Ringer:new()
            assert.are.equals(r._DESCRIPTION, "Lua implementation of ring buffer")
        end)

        it("callable table", function ()
            local r = Ringer()
            assert.are.equals(r._DESCRIPTION, "Lua implementation of ring buffer")
        end)

        it("initial data", function ()
            local data = {1, 2, 3}
            local r = Ringer(data)
            assert.are.equals(r.buffer, data)
        end)

        it("data not a table", function ()
            assert.has_error(
                function () Ringer("a") end,
                "Ringer(): data need to be table type"
            )
        end)
    end)

    describe("buffer size", function ()
        it("empty buffer", function ()
            local r = Ringer()
            assert.are.equals(#r, 0)
        end)

        it("set data on initialization", function ()
            local r = Ringer({"a", "b", "c"})
            assert.are.equals(#r, 3)
        end)

        it("append new data", function ()
            local r = Ringer({"a", "b", "c"})
            r:insert("d")
            assert.are.equals(#r, 4)
        end)

        it("append new data", function ()
            local r = Ringer({"a", "b", "c"})
            r:insert("d")
            assert.are.equals(#r, 4)
        end)
    end)

    describe("remove item", function ()
        it("remove item", function ()
            local r = Ringer({"a", "b", "c"})
            r:remove("b")
            assert.are.equals(#r, 2)
        end)

        it("try to remove not present item", function ()
            local r = Ringer({"a", "b", "c"})
            assert.has_error(
                function () r:remove("d") end,
                "remove(): item 'd' not available"
            )
        end)
    end)

    describe("next", function ()
        it("get next value", function ()
            local r = Ringer({"a", "b", "c"})
            assert.are.equals(r:next(), "b")
        end)

        it("reverse buffer", function ()
            local r = Ringer({"a", "b", "c"})
            r:next()
            r:next()
            assert.are.equals(r:next(), "a")
        end)

        it("empty buffer", function ()
            local r = Ringer({})
            assert.has_error(
                function () r:next() end,
                "next(): buffer is empty!"
            )
        end)
    end)

    describe("get current item", function ()
        it("get available item", function ()
            local r = Ringer({"a", "b", "c"})
            assert.are.equals(r:get(), "a")
        end)

        it("buffer is empty", function ()
            local r = Ringer({})
            assert.has_error(
                function () r:get() end,
                "get(): buffer is empty!"
            )
        end)

        it("reverse buffer", function ()
            local r = Ringer({"a", "b", "c"})
            r:next()
            r:next()
            r:remove("c")
            assert.are.equals(r:get(), "a")
        end)
    end)

    describe("is empty", function ()
        it("empty buffer", function ()
            local r = Ringer({})
            assert.is.True(r:is_empty())
        end)

        it("not empty buffer", function ()
            local r = Ringer({"a", "b", "c"})
            assert.is.False(r:is_empty())
        end)
    end)
end)
