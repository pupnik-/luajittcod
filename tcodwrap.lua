ffi = require ("ffi")
tcod = ffi.load("libtcod-mingw.dll")




ffi.cdef [[

//OMITTED SECTIONS: 3.3, 6.1, 10, 11, 15.1, 15.2,
//TODO 2.2.2, 2.2.7, 2.4.5, 15.3.1 


typedef void * TCOD_console_t;
typedef unsigned char uint8;
typedef char int8;
typedef unsigned short uint16;
typedef short int16;
typedef unsigned int uint32;
typedef int int32;
typedef long intptr;
typedef unsigned long uintptr;
typedef uint8 tcodbool;

//1.0

typedef struct {
	uint8 r,g,b;
} TCOD_color_t;

void TCOD_color_set_HSV(TCOD_color_t *c,float h, float s, float v);
void TCOD_color_set_hue (TCOD_color_t *c, float h);
void TCOD_color_set_saturation (TCOD_color_t *c, float s);
void TCOD_color_set_value (TCOD_color_t *c, float v);
void TCOD_color_get_HSV(TCOD_color_t c,float * h, float * s, float * v);
float TCOD_color_get_hue (TCOD_color_t c);
float TCOD_color_get_saturation (TCOD_color_t c);
float TCOD_color_get_value (TCOD_color_t c);
void TCOD_color_shift_hue (TCOD_color_t *c, float hshift);
void TCOD_color_scale_HSV (TCOD_color_t *c, float scoef, float vcoef);
void TCOD_gen_map(TCOD_color_t *map, int nb_key, TCOD_color_t const *key_color, int const *key_index);



//2.0 console

typedef enum {
	TCODK_NONE,
	TCODK_ESCAPE,
	TCODK_BACKSPACE,
	TCODK_TAB,
	TCODK_ENTER,
	TCODK_SHIFT,
	TCODK_CONTROL,
	TCODK_ALT,
	TCODK_PAUSE,
	TCODK_CAPSLOCK,
	TCODK_PAGEUP,
	TCODK_PAGEDOWN,
	TCODK_END,
	TCODK_HOME,
	TCODK_UP,
	TCODK_LEFT,
	TCODK_RIGHT,
	TCODK_DOWN,
	TCODK_PRINTSCREEN,
	TCODK_INSERT,
	TCODK_DELETE,
	TCODK_LWIN,
	TCODK_RWIN,
	TCODK_APPS,
	TCODK_0,
	TCODK_1,
	TCODK_2,
	TCODK_3,
	TCODK_4,
	TCODK_5,
	TCODK_6,
	TCODK_7,
	TCODK_8,
	TCODK_9,
	TCODK_KP0,
	TCODK_KP1,
	TCODK_KP2,
	TCODK_KP3,
	TCODK_KP4,
	TCODK_KP5,
	TCODK_KP6,
	TCODK_KP7,
	TCODK_KP8,
	TCODK_KP9,
	TCODK_KPADD,
	TCODK_KPSUB,
	TCODK_KPDIV,
	TCODK_KPMUL,
	TCODK_KPDEC,
	TCODK_KPENTER,
	TCODK_F1,
	TCODK_F2,
	TCODK_F3,
	TCODK_F4,
	TCODK_F5,
	TCODK_F6,
	TCODK_F7,
	TCODK_F8,
	TCODK_F9,
	TCODK_F10,
	TCODK_F11,
	TCODK_F12,
	TCODK_NUMLOCK,
	TCODK_SCROLLLOCK,
	TCODK_SPACE,
	TCODK_CHAR
} TCOD_keycode_t;

/* key data : special code or character */
typedef struct {
	TCOD_keycode_t vk; /*  key code */
	char c; /* character if vk == TCODK_CHAR else 0 */
	bool pressed ; /* does this correspond to a key press or key release event ? */
	bool lalt ;
	bool lctrl ;
	bool ralt ;
	bool rctrl ;
	bool shift ;
} TCOD_key_t;

typedef enum {
	/* single walls */
	TCOD_CHAR_HLINE=196,
	TCOD_CHAR_VLINE=179,
	TCOD_CHAR_NE=191,
	TCOD_CHAR_NW=218,
	TCOD_CHAR_SE=217,
	TCOD_CHAR_SW=192,
	TCOD_CHAR_TEEW=180,
	TCOD_CHAR_TEEE=195,
	TCOD_CHAR_TEEN=193,
	TCOD_CHAR_TEES=194,
	TCOD_CHAR_CROSS=197,
	/* double walls */
	TCOD_CHAR_DHLINE=205,
	TCOD_CHAR_DVLINE=186,
	TCOD_CHAR_DNE=187,
	TCOD_CHAR_DNW=201,
	TCOD_CHAR_DSE=188,
	TCOD_CHAR_DSW=200,
	TCOD_CHAR_DTEEW=185,
	TCOD_CHAR_DTEEE=204,
	TCOD_CHAR_DTEEN=202,
	TCOD_CHAR_DTEES=203,
	TCOD_CHAR_DCROSS=206,
	/* blocks */
	TCOD_CHAR_BLOCK1=176,
	TCOD_CHAR_BLOCK2=177,
	TCOD_CHAR_BLOCK3=178,
	/* arrows */
	TCOD_CHAR_ARROW_N=24,
	TCOD_CHAR_ARROW_S=25,
	TCOD_CHAR_ARROW_E=26,
	TCOD_CHAR_ARROW_W=27,
	/* arrows without tail */
	TCOD_CHAR_ARROW2_N=30,
	TCOD_CHAR_ARROW2_S=31,
	TCOD_CHAR_ARROW2_E=16,
	TCOD_CHAR_ARROW2_W=17,
	/* double arrows */
	TCOD_CHAR_DARROW_H=29,
	TCOD_CHAR_DARROW_V=18,
	/* GUI stuff */
	TCOD_CHAR_CHECKBOX_UNSET=224,
	TCOD_CHAR_CHECKBOX_SET=225,
	TCOD_CHAR_RADIO_UNSET=9,
	TCOD_CHAR_RADIO_SET=10,
	/* sub-pixel resolution kit */
	TCOD_CHAR_SUBP_NW=226,
	TCOD_CHAR_SUBP_NE=227,
	TCOD_CHAR_SUBP_N=228,
	TCOD_CHAR_SUBP_SE=229,
	TCOD_CHAR_SUBP_DIAG=230,
	TCOD_CHAR_SUBP_E=231,
	TCOD_CHAR_SUBP_SW=232,
	/* miscellaneous */
	TCOD_CHAR_SMILIE = 1,
	TCOD_CHAR_SMILIE_INV = 2,
	TCOD_CHAR_HEART = 3,
	TCOD_CHAR_DIAMOND = 4,
	TCOD_CHAR_CLUB = 5,
	TCOD_CHAR_SPADE = 6,
	TCOD_CHAR_BULLET = 7,
	TCOD_CHAR_BULLET_INV = 8,
	TCOD_CHAR_MALE = 11,
	TCOD_CHAR_FEMALE = 12,
	TCOD_CHAR_NOTE = 13,
	TCOD_CHAR_NOTE_DOUBLE = 14,
	TCOD_CHAR_LIGHT = 15,
	TCOD_CHAR_EXCLAM_DOUBLE = 19,
	TCOD_CHAR_PILCROW = 20,
	TCOD_CHAR_SECTION = 21,
	TCOD_CHAR_POUND = 156,
	TCOD_CHAR_MULTIPLICATION = 158,
	TCOD_CHAR_FUNCTION = 159,
	TCOD_CHAR_RESERVED = 169,
	TCOD_CHAR_HALF = 171,
	TCOD_CHAR_ONE_QUARTER = 172,
	TCOD_CHAR_COPYRIGHT = 184,
	TCOD_CHAR_CENT = 189,
	TCOD_CHAR_YEN = 190,
	TCOD_CHAR_CURRENCY = 207,
	TCOD_CHAR_THREE_QUARTERS = 243,
	TCOD_CHAR_DIVISION = 246,
	TCOD_CHAR_GRADE = 248,
	TCOD_CHAR_UMLAUT = 249,
	TCOD_CHAR_POW1 = 251,
	TCOD_CHAR_POW3 = 252,
	TCOD_CHAR_POW2 = 253,
	TCOD_CHAR_BULLET_SQUARE = 254,
	/* diacritics */
} TCOD_chars_t;

typedef enum {
	TCOD_COLCTRL_1 = 1,
	TCOD_COLCTRL_2,
	TCOD_COLCTRL_3,
	TCOD_COLCTRL_4,
	TCOD_COLCTRL_5,
	TCOD_COLCTRL_NUMBER=5,
	TCOD_COLCTRL_FORE_RGB,
	TCOD_COLCTRL_BACK_RGB,
	TCOD_COLCTRL_STOP
} TCOD_colctrl_t;

typedef enum {
	TCOD_BKGND_NONE,
	TCOD_BKGND_SET,
	TCOD_BKGND_MULTIPLY,
	TCOD_BKGND_LIGHTEN,
	TCOD_BKGND_DARKEN,
	TCOD_BKGND_SCREEN,
	TCOD_BKGND_COLOR_DODGE,
	TCOD_BKGND_COLOR_BURN,
	TCOD_BKGND_ADD,
	TCOD_BKGND_ADDA,
	TCOD_BKGND_BURN,
	TCOD_BKGND_OVERLAY,
	TCOD_BKGND_ALPH,
	TCOD_BKGND_DEFAULT
} TCOD_bkgnd_flag_t;

typedef enum {
	TCOD_KEY_PRESSED=1,
	TCOD_KEY_RELEASED=2,
} TCOD_key_status_t;

/* custom font flags */
typedef enum {
	TCOD_FONT_LAYOUT_ASCII_INCOL=1,
	TCOD_FONT_LAYOUT_ASCII_INROW=2,
	TCOD_FONT_TYPE_GREYSCALE=4,
	TCOD_FONT_TYPE_GRAYSCALE=4,
	TCOD_FONT_LAYOUT_TCOD=8,
} TCOD_font_flags_t;

typedef enum {
	TCOD_RENDERER_GLSL,
	TCOD_RENDERER_OPENGL,
	TCOD_RENDERER_SDL,
	TCOD_NB_RENDERERS,
} TCOD_renderer_t;

typedef enum {
	TCOD_LEFT, 
	TCOD_RIGHT, 
	TCOD_CENTER 
} TCOD_alignment_t;

typedef enum {
  TCOD_EVENT_KEY_PRESS=1,
  TCOD_EVENT_KEY_RELEASE=2,
  TCOD_EVENT_KEY=TCOD_EVENT_KEY_PRESS|TCOD_EVENT_KEY_RELEASE,
  TCOD_EVENT_MOUSE_MOVE=4,
  TCOD_EVENT_MOUSE_PRESS=8,
  TCOD_EVENT_MOUSE_RELEASE=16,
  TCOD_EVENT_MOUSE=TCOD_EVENT_MOUSE_MOVE|TCOD_EVENT_MOUSE_PRESS|TCOD_EVENT_MOUSE_RELEASE,
  TCOD_EVENT_ANY=TCOD_EVENT_KEY|TCOD_EVENT_MOUSE,
} TCOD_event_t;

typedef struct {
  int x,y; /* absolute position */
  int dx,dy; /* movement since last update in pixels */
  int cx,cy; /* cell coordinates in the root console */
  int dcx,dcy; /* movement since last update in console cells */
  bool lbutton ; /* left button status */
  bool rbutton ; /* right button status */
  bool mbutton ; /* middle button status */
  bool lbutton_pressed ; /* left button pressed event */ 
  bool rbutton_pressed ; /* right button pressed event */ 
  bool mbutton_pressed ; /* middle button pressed event */ 
  bool wheel_up ; /* wheel up event */
  bool wheel_down ; /* wheel down event */
} TCOD_mouse_t;

/* PRNG algorithms */
typedef enum {
    TCOD_RNG_MT,
    TCOD_RNG_CMWC
} TCOD_random_algo_t;

typedef enum {
	TCOD_DISTRIBUTION_LINEAR,
	TCOD_DISTRIBUTION_GAUSSIAN,
	TCOD_DISTRIBUTION_GAUSSIAN_RANGE,
	TCOD_DISTRIBUTION_GAUSSIAN_INVERSE,
	TCOD_DISTRIBUTION_GAUSSIAN_RANGE_INVERSE
} TCOD_distribution_t;

typedef void *TCOD_noise_t;

typedef enum {
	TCOD_NOISE_PERLIN = 1,
	TCOD_NOISE_SIMPLEX = 2,
	TCOD_NOISE_WAVELET = 4,
	TCOD_NOISE_DEFAULT = 0
} TCOD_noise_type_t;

typedef struct _TCOD_tree_t {
	struct _TCOD_tree_t *next;
	struct _TCOD_tree_t *father;
	struct _TCOD_tree_t *sons;
} TCOD_tree_t;

typedef struct {
	TCOD_tree_t tree; /* pseudo oop : bsp inherit tree */
	int x,y,w,h; /* node position & size */
	int position; /* position of splitting */
	uint8 level; /* level in the tree */
	bool horizontal; /* horizontal splitting ? */
} TCOD_bsp_t;

typedef struct {
    int w,h;
    float *values;
} TCOD_heightmap_t;

typedef enum { FOV_BASIC, 
               FOV_DIAMOND, 
               FOV_SHADOW, 
               FOV_PERMISSIVE_0,FOV_PERMISSIVE_1,FOV_PERMISSIVE_2,FOV_PERMISSIVE_3,
               FOV_PERMISSIVE_4,FOV_PERMISSIVE_5,FOV_PERMISSIVE_6,FOV_PERMISSIVE_7,FOV_PERMISSIVE_8, 
               FOV_RESTRICTIVE,
               NB_FOV_ALGORITHMS } TCOD_fov_algorithm_t;




typedef void *TCOD_image_t;
typedef bool (*TCOD_line_listener_t) (int x, int y);
typedef void (*SDL_renderer_t) (void *sdl_surface);
typedef void *TCOD_random_t;
typedef void *TCOD_map_t;
typedef void *TCOD_path_t;
typedef float (*TCOD_path_func_t)( int xFrom, int yFrom, int xTo, int yTo, void *user_data );
typedef void *TCOD_dijkstra_t;


//2.1.1
void TCOD_console_init_root (int w, int h, const char * title, bool fullscreen, TCOD_renderer_t renderer);

//2.1.2
void TCOD_console_set_custom_font(const char *fontFile, int flags,int nb_char_horiz, int nb_char_vertic);

//2.1.3
void TCOD_console_map_ascii_code_to_font(int asciiCode, int fontCharX, int fontCharY);
void TCOD_console_map_ascii_codes_to_font(int firstAsciiCode, int nbCodes, int fontCharX, int fontCharY);
void TCOD_console_map_string_to_font(const char *s, int fontCharX, int fontCharY);

//2.1.4
bool TCOD_console_is_fullscreen();
void TCOD_console_set_fullscreen(bool fullscreen);

//2.1.5
void TCOD_console_set_window_title(const char *title);
bool TCOD_console_is_window_closed();

//2.1.6
void TCOD_console_credits();
bool TCOD_console_credits_render(int x, int y, bool alpha);


//2.2.1
void TCOD_console_set_default_background(TCOD_console_t con,TCOD_color_t back);
void TCOD_console_set_default_foreground(TCOD_console_t con,TCOD_color_t fore);
void TCOD_console_clear(TCOD_console_t con);
void TCOD_console_set_char_background(TCOD_console_t con,int x, int y, TCOD_color_t col, TCOD_bkgnd_flag_t flag);
void TCOD_console_set_char_foreground(TCOD_console_t con,int x, int y, TCOD_color_t col);
void TCOD_console_set_char(TCOD_console_t con,int x, int y, int c);
void TCOD_console_put_char(TCOD_console_t con,int x, int y, int c, TCOD_bkgnd_flag_t flag);
void TCOD_console_put_char_ex(TCOD_console_t con,int x, int y, int c, TCOD_color_t fore, TCOD_color_t back);

//2.2.2
//background effect flags
//COME BACK TO THIS

//2.2.3
void TCOD_console_set_background_flag(TCOD_console_t con,TCOD_bkgnd_flag_t flag);
TCOD_bkgnd_flag_t TCOD_console_get_background_flag(TCOD_console_t con);
void TCOD_console_set_alignment(TCOD_console_t con,TCOD_bkgnd_flag_t alignment);
TCOD_alignment_t TCOD_console_get_alignment(TCOD_console_t con);
void TCOD_console_print(TCOD_console_t con,int x, int y, const char *fmt, ...);
void TCOD_console_print_ex(TCOD_console_t con,int x, int y, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const char *fmt, ...);
int TCOD_console_print_rect(TCOD_console_t con,int x, int y, int w, int h, const char *fmt, ...);
int TCOD_console_print_rect_ex(TCOD_console_t con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const char *fmt, ...);
int TCOD_console_get_height_rect(TCOD_console_t con,int x, int y, int w, int h, const char *fmt, ...);
void TCOD_console_set_color_control(TCOD_colctrl_t con, TCOD_color_t fore, TCOD_color_t back);

/*UNICODE FUNCTIONS*/
void TCOD_console_map_string_to_font_utf(const wchar_t *s, int fontCharX, int fontCharY);
void TCOD_console_print_utf(TCOD_console_t con,int x, int y, const wchar_t *fmt, ...);
void TCOD_console_print_ex_utf(TCOD_console_t con,int x, int y, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const wchar_t *fmt, ...);
int TCOD_console_print_rect_utf(TCOD_console_t con,int x, int y, int w, int h, const wchar_t *fmt, ...);
int TCOD_console_print_rect_ex_utf(TCOD_console_t con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const wchar_t *fmt, ...);
int TCOD_console_get_height_rect_utf(TCOD_console_t con,int x, int y, int w, int h, const wchar_t *fmt, ...);

//2.2.4
void TCOD_console_rect(TCOD_console_t con,int x, int y, int w, int h, bool clear, TCOD_bkgnd_flag_t flag);
void TCOD_console_hline(TCOD_console_t con,int x,int y, int l, TCOD_bkgnd_flag_t flag);
void TCOD_console_vline(TCOD_console_t con,int x,int y, int l, TCOD_bkgnd_flag_t flag);
void TCOD_console_print_frame(TCOD_console_t con,int x,int y,int w,int h, bool clear, TCOD_bkgnd_flag_t flag, const char *fmt, ...);

//2.2.5
int TCOD_console_get_width(TCOD_console_t con);
int TCOD_console_get_height(TCOD_console_t con);
TCOD_color_t TCOD_console_get_default_background(TCOD_console_t con);
TCOD_color_t TCOD_console_get_default_foreground(TCOD_console_t con);
TCOD_color_t TCOD_console_get_char_background(TCOD_console_t con,int x, int y);
TCOD_color_t TCOD_console_get_char_foreground(TCOD_console_t con,int x, int y);
int TCOD_console_get_char(TCOD_console_t con,int x, int y);

//2.2.6
void TCOD_console_set_fade(uint8 fade, TCOD_color_t fadingColor);
uint8 TCOD_console_get_fade();
TCOD_color_t TCOD_console_get_fading_color();

//2.2.7
/*COME BACK TO THIS!!!!*/


//2.3.1
void TCOD_console_flush();

//2.4.1
TCOD_key_t TCOD_console_wait_for_keypress(bool flush);
TCOD_event_t TCOD_sys_wait_for_event(int eventMask, TCOD_key_t *key, TCOD_mouse_t *mouse, bool flush);

//2.4.2
TCOD_key_t TCOD_console_check_for_keypress(int flags);
bool TCOD_console_is_key_pressed(TCOD_keycode_t key);
TCOD_event_t TCOD_sys_check_for_event(int eventMask, TCOD_key_t *key, TCOD_mouse_t *mouse);

//2.4.3
void TCOD_console_set_keyboard_repeat(int initial_delay, int interval);
void TCOD_console_disable_keyboard_repeat();

//2.4.4
typedef struct {
    TCOD_keycode_t vk;
    char c;
    bool pressed;
    bool lalt;
    bool lctrl;
    bool ralt;
    bool rctrl;
    bool shift;
} TCOD_key_t;



//2.4.5
/*COME BACK TO THIS*/

//2.5
TCOD_console_t TCOD_console_new(int w, int h);
TCOD_console_t TCOD_console_from_file(const char *filename);
bool TCOD_console_load_asc(TCOD_console_t con, const char *filename);
bool TCOD_console_load_apf(TCOD_console_t con, const char *filename);
bool TCOD_console_save_asc(TCOD_console_t con, const char *filename);
bool TCOD_console_save_apf(TCOD_console_t con, const char *filename);
void TCOD_console_blit(TCOD_console_t src,int xSrc, int ySrc, int wSrc, int hSrc, TCOD_console_t dst, int xDst, int yDst, float foreground_alpha, float background_alpha);
void TCOD_console_set_key_color(TCOD_console_t con,TCOD_color_t col);
void TCOD_console_delete(TCOD_console_t con);

//3.1
void TCOD_sys_set_fps(int val);
int TCOD_sys_get_fps();
float TCOD_sys_get_last_frame_length();
void TCOD_sys_sleep_milli(uint32 val);
uint32 TCOD_sys_elapsed_milli();
float TCOD_sys_elapsed_seconds();

//3.2
void TCOD_sys_save_screenshot(const char *filename);

//3.3 USE LUA

//3.4
void TCOD_sys_register_SDL_renderer(SDL_renderer_t callback);
void TCOD_console_set_dirty(int x, int y, int w, int h);

//3.5
void TCOD_sys_force_fullscreen_resolution(int width, int height);
void TCOD_sys_get_current_resolution(int *width, int *height);
void TCOD_sys_get_fullscreen_offsets(int *offx, int *offy);
void TCOD_sys_get_char_size(int *width, int *height);
void TCOD_sys_update_char(int asciiCode, int fontx, int fonty, TCOD_image_t img, int x, int y);
void TCOD_sys_set_renderer(TCOD_renderer_t renderer);
TCOD_renderer_t TCOD_sys_get_renderer();

//3.6
void TCOD_sys_clipboard_set(const char *value);
char *TCOD_sys_clipboard_get();

//4
void TCOD_line_init (int xFrom, int yFrom, int xTo, int yTo);
bool TCOD_line_step (int * xCur, int * yCur);
bool TCOD_line(int xFrom, int yFrom, int xTo, int yTo, TCOD_line_listener_t listener);

//5.1
TCOD_image_t TCOD_image_new(int width, int height);
TCOD_image_t TCOD_image_load(const char *filename);
TCOD_image_t TCOD_image_from_console(TCOD_console_t console);
void TCOD_image_refresh_console(TCOD_image_t image, TCOD_console_t console);


//5.2
void TCOD_image_get_size(TCOD_image_t image, int *w,int *h);
TCOD_color_t TCOD_image_get_pixel(TCOD_image_t image,int x, int y);
int TCOD_image_get_alpha(TCOD_image_t image, int x, int y);
bool TCOD_image_is_pixel_transparent(TCOD_image_t image,int x, int y);
TCOD_color_t TCOD_image_get_mipmap_pixel(TCOD_image_t image,float x0,float y0, float x1, float y1);

//5.3
void TCOD_image_clear(TCOD_image_t image, TCOD_color_t color);
void TCOD_image_put_pixel(TCOD_image_t image,int x, int y,TCOD_color_t col);
void TCOD_image_scale(TCOD_image_t image,int neww, int newh);
void TCOD_image_hflip(TCOD_image_t image);
void TCOD_image_vflip(TCOD_image_t image);
void TCOD_image_rotate90(TCOD_image_t image, int numRotations);
void TCOD_image_invert(TCOD_image_t image);

//5.4
void TCOD_image_save(TCOD_image_t image, const char *filename);

//5.5
void TCOD_image_blit_rect(TCOD_image_t image, TCOD_console_t console, int x, int y, int w, int h, TCOD_bkgnd_flag_t bkgnd_flag);
void TCOD_image_blit(TCOD_image_t image, TCOD_console_t console, int x, int y, TCOD_bkgnd_flag_t bkgnd_flag, float scalex, float scaley, float angle);
void TCOD_image_set_key_color(TCOD_image_t image, TCOD_color_t keyColor);
void TCOD_image_blit_2x(TCOD_image_t image, TCOD_console_t dest, int dx, int dy, int sx, int sy, int w, int h);

//6.1
//USE LUA INSTEAD

//7.1
TCOD_random_t TCOD_random_get_instance (void);
TCOD_random_t TCOD_random_new (TCOD_random_algo_t algo);
TCOD_random_t TCOD_random_new_from_seed (TCOD_random_algo_t algo, uint32 seed);
void TCOD_random_delete(TCOD_random_t mersenne);

//7.2
void TCOD_random_set_distribution(TCOD_random_t mersenne, TCOD_distribution_t distribution);

//7.3
int TCOD_random_get_int(TCOD_random_t mersenne, int min, int max);
int TCOD_random_get_int_mean(TCOD_random_t mersenne, int min, int max, int mean);
float TCOD_random_get_float(TCOD_random_t mersenne, float min, float max);
float TCOD_random_get_float_mean(TCOD_random_t mersenne, float min, float max, float mean);
double TCOD_random_get_double(TCOD_random_t mersenne, double min, double max);
double TCOD_random_get_double_mean(TCOD_random_t mersenne, double min, double max, double mean);
TCOD_random_t TCOD_random_save(TCOD_random_t mersenne);
void TCOD_random_restore(TCOD_random_t mersenne, TCOD_random_t backup);

//8
void TCOD_mouse_show_cursor (bool visible);
bool TCOD_mouse_is_cursor_visible (void);
void TCOD_mouse_move (int x, int y);
TCOD_mouse_t TCOD_mouse_get_status (void);

//9.1
TCOD_noise_t TCOD_noise_new(int dimensions, float hurst, float lacunarity, TCOD_random_t random);
void TCOD_noise_delete(TCOD_noise_t noise);

//9.2
void TCOD_noise_set_type(TCOD_noise_t noise, TCOD_noise_type_t type);

//9.3
float TCOD_noise_get(TCOD_noise_t noise, float *f);
float TCOD_noise_get_ex(TCOD_noise_t noise, float *f, TCOD_noise_type_t type);

//9.4
float TCOD_noise_get_fbm(TCOD_noise_t noise, float *f, float octaves);
float TCOD_noise_get_fbm(TCOD_noise_t noise, float *f, float octaves, TCOD_noise_type_t type);

//9.5
float TCOD_noise_get_turbulence(TCOD_noise_t noise, float *f, float octaves);
float TCOD_noise_get_turbulence_ex(TCOD_noise_t noise, float *f, float octaves, TCOD_noise_type_t);

//10
//USE LUA

//11
//USE LUA

//12

//12.1
TCOD_bsp_t *TCOD_bsp_new_with_size(int x,int y,int w, int h);
void TCOD_bsp_remove_sons(TCOD_bsp_t *node);
void TCOD_bsp_delete(TCOD_bsp_t *node);

//12.2
void TCOD_bsp_split_once(TCOD_bsp_t *node, bool horizontal, int position);
void TCOD_bsp_split_recursive(TCOD_bsp_t *node, TCOD_random_t randomizer, int nb, int minHSize, int minVSize, float maxHRatio, float maxVRatio);

//12.3
void TCOD_bsp_resize(TCOD_bsp_t *node, int x,int y, int w, int h);

//12.4
TCOD_bsp_t * TCOD_bsp_left(TCOD_bsp_t *node);
TCOD_bsp_t * TCOD_bsp_right(TCOD_bsp_t *node);
TCOD_bsp_t * TCOD_bsp_father(TCOD_bsp_t *node);
bool TCOD_bsp_is_leaf(TCOD_bsp_t *node);
bool TCOD_bsp_contains(TCOD_bsp_t *node, int cx, int cy);
TCOD_bsp_t * TCOD_bsp_find_node(TCOD_bsp_t *node, int cx, int cy);

//12.5
typedef bool (*TCOD_bsp_callback_t)(TCOD_bsp_t *node, void *userData);
bool TCOD_bsp_traverse_pre_order(TCOD_bsp_t *node, TCOD_bsp_callback_t callback, void *userData);
bool TCOD_bsp_traverse_in_order(TCOD_bsp_t *node, TCOD_bsp_callback_t callback, void *userData);
bool TCOD_bsp_traverse_post_order(TCOD_bsp_t *node, TCOD_bsp_callback_t callback, void *userData);
bool TCOD_bsp_traverse_level_order(TCOD_bsp_t *node, TCOD_bsp_callback_t callback, void *userData);
bool TCOD_bsp_traverse_inverted_level_order(TCOD_bsp_t *node, TCOD_bsp_callback_t callback, void *userData);

//13.1
TCOD_map_t TCOD_map_new (int width, int height);
void TCOD_map_set_properties (TCOD_map_t map, int x, int y, bool is_transparent, bool is_walkable);
void TCOD_map_clear (TCOD_map_t map, bool transparent, bool walkable);
void TCOD_map_copy (TCOD_map_t source, TCOD_map_t dest);

//13.2
void TCOD_map_compute_fov(TCOD_map_t map, int player_x, int player_y, int max_radius, bool light_walls, TCOD_fov_algorithm_t algo);

//13.3
bool TCOD_map_is_in_fov(TCOD_map_t map, int x, int y);
bool TCOD_map_is_transparent(TCOD_map_t map, int x, int y);
bool TCOD_map_is_walkable(TCOD_map_t map, int x, int y);
int TCOD_map_get_width(TCOD_map_t map);
int TCOD_map_get_height(TCOD_map_t map);

//14.1
TCOD_heightmap_t *TCOD_heightmap_new(int w,int h);
void TCOD_heightmap_delete(TCOD_heightmap_t *hm);


//14.2
void TCOD_heightmap_set_value(TCOD_heightmap_t *hm, int x, int y, float value);
void TCOD_heightmap_add(TCOD_heightmap_t *hm, float value);
void TCOD_heightmap_scale(TCOD_heightmap_t *hm, float value);
void TCOD_heightmap_clear(TCOD_heightmap_t *hm);
void TCOD_heightmap_clamp(TCOD_heightmap_t *hm, float min, float max);
void TCOD_heightmap_copy(const TCOD_heightmap_t *source,TCOD_heightmap_t *dest);
void TCOD_heightmap_normalize(TCOD_heightmap_t *hm, float min, float max);
void TCOD_heightmap_lerp_hm(const TCOD_heightmap_t *a, const TCOD_heightmap_t *b, TCOD_heightmap_t *res, float coef);
void TCOD_heightmap_add_hm(const TCOD_heightmap_t *a, const TCOD_heightmap_t *b, TCOD_heightmap_t *res);
void TCOD_heightmap_multiply_hm(const TCOD_heightmap_t *a, const TCOD_heightmap_t *b, TCOD_heightmap_t *res);

//14.3
void TCOD_heightmap_add_hill(TCOD_heightmap_t *hm, float x, float y, float radius, float height);
void TCOD_heightmap_dig_hill(TCOD_heightmap_t *hm, float x, float y, float radius, float height);
void TCOD_heightmap_rain_erosion(TCOD_heightmap_t *hm, int nbDrops,float erosionCoef,float sedimentationCoef,TCOD_random_t rnd);
void TCOD_heightmap_kernel_transform(TCOD_heightmap_t *hm, int kernelsize, int *dx, int *dy, float *weight, float minLevel,float maxLevel);
void TCOD_heightmap_add_voronoi(TCOD_heightmap_t *hm, int nbPoints, int nbCoef, float *coef,TCOD_random_t rnd);
void TCOD_heightmap_add_fbm(TCOD_heightmap_t *hm, TCOD_noise_t noise,float mulx, float muly, float addx, float addy, float octaves, float delta, float scale);
void TCOD_heightmap_scale_fbm(TCOD_heightmap_t *hm, TCOD_noise_t noise,float mulx, float muly, float addx, float addy, float octaves, float delta, float scale);
void TCOD_heightmap_dig_bezier(TCOD_heightmap_t *hm, int px[4], int py[4], float startRadius, float startDepth, float endRadius, float endDepth);

//14.4
float TCOD_heightmap_get_value(const TCOD_heightmap_t *hm, int x, int y);
float TCOD_heightmap_get_interpolated_value(const TCOD_heightmap_t *hm, float x, float y);
float TCOD_heightmap_get_slope(const TCOD_heightmap_t *hm, int x, int y);
void TCOD_heightmap_get_normal(const TCOD_heightmap_t *hm, float x, float y, float n[3], float waterLevel);
int TCOD_heightmap_count_cells(const TCOD_heightmap_t *hm, float min, float max);
bool TCOD_heightmap_has_land_on_border(const TCOD_heightmap_t *hm, float waterLevel);
void TCOD_heightmap_get_minmax(const TCOD_heightmap_t *hm, float *min, float *max);

//15.1

//15.2

//15.3.1
//COME BACK TO THIS ONE

//16.1
TCOD_path_t TCOD_path_new_using_map(TCOD_map_t map, float diagonalCost);
TCOD_dijkstra_t TCOD_dijkstra_new(TCOD_map_t map, float diagonalCost);
TCOD_path_t TCOD_path_new_using_function(int width, int height, TCOD_path_func_t callback, void *user_data, float diagonalCost);
TCOD_dijkstra_t TCOD_dijkstra_new_using_function(int width, int height, TCOD_path_func_t callback, void *user_data, float diagonalCost);
void TCOD_path_delete(TCOD_path_t path);
void TCOD_dijkstra_delete(TCOD_dijkstra_t dijkstra);

//16.2
bool TCOD_path_compute(TCOD_path_t path, int ox,int oy, int dx, int dy);
void TCOD_path_reverse(TCOD_path_t path);
void TCOD_dijkstra_reverse(TCOD_dijkstra_t dijkstra);
void TCOD_dijkstra_compute(TCOD_dijkstra_t dijkstra, int root_x, int root_y);
bool TCOD_dijkstra_path_set(TCOD_dijkstra_t dijkstra, int to_x, int to_y);

//16.3
void TCOD_path_get_origin(TCOD_path_t path, int *x, int *y);
void TCOD_path_get_destination(TCOD_path_t path, int *x, int *y);
int TCOD_path_size(TCOD_path_t path);
int TCOD_dijkstra_size(TCOD_dijkstra_t dijkstra);
void TCOD_path_get(TCOD_path_t path, int index, int *x, int *y);
void TCOD_dijkstra_get(TCOD_dijkstra_t dijkstra, int index, int *x, int *y);
bool TCOD_path_is_empty(TCOD_path_t path);
bool TCOD_dijkstra_is_empty(TCOD_dijkstra_t dijkstra);
bool TCOD_path_walk(TCOD_path_t path, int *x, int *y, bool recalculate_when_needed);
bool TCOD_dijkstra_walk(TCOD_dijkstra_t dijkstra, int *x, int *y);
float TCOD_dijkstra_get_distance(TCOD_dijkstra_t dijkstra, int x, int y);


]]


--2.1.1
function console_init_root(w, h, title, fullscreen, renderer)
	fullscreen = fullscreen or false
	rendered = renderer or tcod.TCOD_RENDERER_SDL
	tcod.TCOD_console_init_root(w, h, title, fullscreen, renderer)
end


--2.3
function console_flush()
	tcod.TCOD_console_flush()
end

--2.4.2
function console_is_key_pressed(key)
	return tcod.TCOD_console_is_key_pressed(key)
end

--3.1
function sys_set_fps(x)
	math.floor(x)
	tcod.TCOD_sys_set_fps(x)
end

function sys_sleep_milli(x)
	math.floor(x)
	tcod.TCOD_sys_sleep_milli(x)
end

