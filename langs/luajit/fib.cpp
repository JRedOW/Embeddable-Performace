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
        "function fib(n)\n"
        "  if n < 2 then\n"
        "    return n\n"
        "  end\n"
        "  return fib(n-1) + fib(n-2)\n"
        "end\n"
    ); // loads the Lua function

    for (int i = 0; i < 1000; i++) {
        // *** call Lua function from C++ ***
        lua_getglobal(L, "fib"); // find the Lua function
        lua_pushnumber(L, 15); // push number as first param

        if (lua_pcall(L, 1, 1, 0) != 0) { // call the function passing 1 param
            luaL_error(L, "failed to call fib: %s", lua_tostring(L, -1));
        }

        int res = lua_tonumber(L, -1);

        lua_pop(L, 1);
    }

    return 0;
}
