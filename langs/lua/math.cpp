#include <iostream>

// include Lua headers
extern "C" {
    #include <lua.h>
    #include <lualib.h>
    #include <lauxlib.h>
}

int main (int argc, const char * argv[])
{
    lua_State* L = luaL_newstate(); // create a new lua instance
    luaL_openlibs(L);
    luaL_dostring(L, 
        "function math(n)\n"
        "  n = n * 11\n"
        "  n = n - 1\n"
        "  n = n / 3\n"
        "  n = n + 5\n"
        "  return n\n"
        "end\n"
    ); // loads the Lua function

    for (int i = 0; i < 100000; i++) {
        // *** call Lua function from C++ ***
        lua_getglobal(L, "math"); // find the Lua function
        lua_pushnumber(L, 9.0); // push number as first param

        if (lua_pcall(L, 1, 1, 0) != 0) { // call the function passing 1 param
            luaL_error(L, "failed to call math: %s", lua_tostring(L, -1));
        }

        float res = lua_tonumber(L, -1);

        lua_pop(L, 1);
    }

    return 0;
}
