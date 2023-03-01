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
        "function echo(x)\n"
        "  return x\n"
        "end\n"
    ); // loads the Lua function

    std::string s = "bench";

    for (int i = 0; i < 100000; i++) {
        // *** call Lua function from C++ ***
        lua_getglobal(L, "echo"); // find the Lua function
        lua_pushlstring(L, s.c_str(), s.size()); // push string as first param

        if (lua_pcall(L, 1, 1, 0) != 0) { // call the function passing 1 param
            luaL_error(L, "failed to call echo: %s", lua_tostring(L, -1));
        }

        std::string res(lua_tostring(L, -1));

        lua_pop(L, 1);
    }

    return 0;
}
