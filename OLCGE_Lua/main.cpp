#include <assert.h>
#include <iostream>
#include <stack>

#include "selene.h"
#include "olcConsoleGameEngine.h"

#define stringify( name ) # name

class OLCGE_Lua : public olcConsoleGameEngine
{
public:
	OLCGE_Lua(std::string gameFolder) {
		this->state = new sel::State(true);
		setupCge();
		setupColours();
		setupPixelTypes();

		this->state.Load("./system/keys.lua");
		this->state.Load("./" + gameFolder + "/main.lua");

		auto init = this->state["Init"];

		if (init.exists()) {
			init();
		}
	}

private:
	sel::State state;


	// Setup functions
private:
	void setupCge() {
		this->state["cge"].SetObj(*this,
			"Fill", &OLCGE_Lua::bridgeFill,
			"FillCircle", &OLCGE_Lua::bridgeFillCircle,

			"Draw", &OLCGE_Lua::bridgeDraw,
			"DrawCircle", &OLCGE_Lua::bridgeDrawCircle,
			"DrawString", &OLCGE_Lua::bridgeDrawString,
			"DrawStringAlpha", &OLCGE_Lua::bridgeDrawStringAlpha,
			"DrawLine", &OLCGE_Lua::bridgeDrawLine,
			"DrawSprite", &OLCGE_Lua::bridgeDrawSprite,
			"DrawPartialSprite", &OLCGE_Lua::DrawPartialSprite,

			"CreateSprite", &OLCGE_Lua::bridgeCreateSprite,
			"CreateBlankSprite", &OLCGE_Lua::bridgeBlankCreate,

			"ScreenHeight", &OLCGE_Lua::ScreenHeight,
			"ScreenWidth", &OLCGE_Lua::ScreenWidth,

			"SetTitle", &OLCGE_Lua::bridgeSetTitle,
			"IsFocused", &OLCGE_Lua::IsFocused,

			"GetMouseX", &OLCGE_Lua::GetMouseX,
			"GetMouseY", &OLCGE_Lua::GetMouseY,
			"IsMousePressed", &OLCGE_Lua::IsMousePressed,
			"IsMouseReleased", &OLCGE_Lua::IsMouseReleased,
			"IsMouseHeld", &OLCGE_Lua::IsMouseHeld,

			"IsKeyPressed", &OLCGE_Lua::IsKeyPressed,
			"IsKeyReleased", &OLCGE_Lua::IsKeyReleased,
			"IsKeyHeld", &OLCGE_Lua::IsKeyHeld
		);

		auto print = [](std::string str) {
			OutputDebugStringA(str.c_str());
			OutputDebugStringA("\n");
		};
		this->state["debug"] = print;
	}

	void setupColours() {
		this->state["colour"]["FG_BLACK"] = int(FG_BLACK);
		this->state["colour"]["FG_DARK_BLUE"] = int(FG_DARK_BLUE);
		this->state["colour"]["FG_DARK_GREEN"] = int(FG_DARK_GREEN);
		this->state["colour"]["FG_DARK_CYAN"] = int(FG_DARK_CYAN);
		this->state["colour"]["FG_DARK_RED"] = int(FG_DARK_RED);
		this->state["colour"]["FG_DARK_MAGENTA"] = int(FG_DARK_MAGENTA);
		this->state["colour"]["FG_DARK_YELLOW"] = int(FG_DARK_YELLOW);
		this->state["colour"]["FG_GREY"] = int(FG_GREY);
		this->state["colour"]["FG_DARK_GREY"] = int(FG_DARK_GREY);
		this->state["colour"]["FG_BLUE"] = int(FG_BLUE);
		this->state["colour"]["FG_GREEN"] = int(FG_GREEN);
		this->state["colour"]["FG_CYAN"] = int(FG_CYAN);
		this->state["colour"]["FG_RED"] = int(FG_RED);
		this->state["colour"]["FG_MAGENTA"] = int(FG_MAGENTA);
		this->state["colour"]["FG_YELLOW"] = int(FG_YELLOW);
		this->state["colour"]["FG_WHITE"] = int(FG_WHITE);

		this->state["colour"]["BG_BLACK"] = int(BG_BLACK);
		this->state["colour"]["BG_DARK_BLUE"] = int(BG_DARK_BLUE);
		this->state["colour"]["BG_DARK_GREEN"] = int(BG_DARK_GREEN);
		this->state["colour"]["BG_DARK_CYAN"] = int(BG_DARK_CYAN);
		this->state["colour"]["BG_DARK_RED"] = int(BG_DARK_RED);
		this->state["colour"]["BG_DARK_MAGENTA"] = int(BG_DARK_MAGENTA);
		this->state["colour"]["BG_DARK_YELLOW"] = int(BG_DARK_YELLOW);
		this->state["colour"]["BG_GREY"] = int(BG_GREY);
		this->state["colour"]["BG_DARK_GREY"] = int(BG_DARK_GREY);
		this->state["colour"]["BG_BLUE"] = int(BG_BLUE);
		this->state["colour"]["BG_GREEN"] = int(BG_GREEN);
		this->state["colour"]["BG_CYAN"] = int(BG_CYAN);
		this->state["colour"]["BG_RED"] = int(BG_RED);
		this->state["colour"]["BG_MAGENTA"] = int(BG_MAGENTA);
		this->state["colour"]["BG_YELLOW"] = int(BG_YELLOW);
		this->state["colour"]["BG_WHITE"] = int(BG_WHITE);
	}

	void setupPixelTypes() {
		this->state["pixel"]["SOLID"] = int(PIXEL_SOLID);
		this->state["pixel"]["THREEQUARTERS"] = int(PIXEL_THREEQUARTERS);
		this->state["pixel"]["HALF"] = int(PIXEL_HALF);
		this->state["pixel"]["QUARTER"] = int(PIXEL_QUARTER);
		this->state["pixel"]["SPACE"] = int(PIXEL_SPACE);
	}

	// These are bridge functions as some functions call werid values
private:
	void bridgeSetTitle(std::string title) {
		std::wstring data(title.begin(), title.end());
		
		m_sAppName = data;
	}

	void bridgeFill(int x1, int y1, int x2, int y2, int c, int col) {
		Fill(x1, y1, x2, y2, (wchar_t)c, short(col));
	}

	void bridgeFillCircle(int xc, int yc, int r, int c, int col) {
		FillCircle(xc, yc, r, (wchar_t)c, short(col));
	}

	void bridgeDrawString(int x, int y, std::string text, int col) {
		std::wstring data(text.begin(), text.end());

		DrawString(x, y, data, short(col));
	}

	void bridgeDrawStringAlpha(int x, int y, std::string text, int col) {
		std::wstring data(text.begin(), text.end());

		DrawStringAlpha(x, y, data, short(col));
	}

	void bridgeDraw(int x, int y, int c, int col) {
		Draw(x, y, (wchar_t)c, short(col));
	}

	void bridgeDrawCircle(int xc, int yc, int r, int c, int col) {
		DrawCircle(xc, yc, r, (wchar_t)c, short(col));
	}

	void bridgeDrawLine(int x1, int y1, int x2, int y2, int c, int col) {
		DrawLine(x1, y1, x2, y2, (wchar_t)c, short(col));
	}

	void bridgeDrawSprite(int x, int y, void *sprite) {
		DrawSprite(x, y, (olcSprite*)sprite);
	}

	olcSprite* bridgeCreateSprite(std::string file) {
		std::wstring sFile(file.begin(), file.end());

		auto spr = new olcSprite(sFile);

		assert(spr != nullptr);

		return spr;
	}

	olcSprite* bridgeBlankCreate(int x, int y) {
		return new olcSprite(x, y);
	}

	// Keyboard input
	bool IsKeyPressed(int nKeyID) {
		return m_keys[nKeyID].bPressed;
	}

	bool IsKeyReleased(int nKeyID) {
		return m_keys[nKeyID].bReleased;
	}

	bool IsKeyHeld(int nKeyID) {
		return m_keys[nKeyID].bHeld;
	}

	// Mouse Input
	bool IsMousePressed(int nMouseButtonID) {
		return m_mouse[nMouseButtonID - 1].bPressed;
	}

	bool IsMouseReleased(int nMouseButtonID) {
		return m_mouse[nMouseButtonID - 1].bReleased;
	}

	bool IsMouseHeld(int nMouseButtonID) {
		return m_mouse[nMouseButtonID - 1].bHeld;
	}

protected:

	virtual bool OnUserCreate()
	{
		return bool(state["OnUserCreate"]());
	}

	virtual bool OnUserUpdate(float fElapsedTime)
	{
		return bool(state["OnUserUpdate"](fElapsedTime));
	}

	virtual bool OnUserDestroy() {
		auto kill = state["OnUserDestroy"];
		
		if (kill.exists()) {
			return bool(kill());
		}

		return true;
	}

};

int main() {
	sel::State state;
	state.Load("./config.lua");

	std::string gameFolder = state["game"]["folder"];
	state.Load("./" + gameFolder + "/options.lua");


	int width = int(state["console"]["width"]);
	int height = int(state["console"]["height"]);
	int fontw = int(state["console"]["fontw"]);
	int fonth = int(state["console"]["fonth"]);

	OLCGE_Lua game(gameFolder);
	game.ConstructConsole(width, height, fontw, fonth);
	game.Start();

	return 0;
}