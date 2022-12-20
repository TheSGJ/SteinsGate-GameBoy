;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _joypad
	.globl _delay
	.globl _Okabe
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_Okabe::
	.ds 32
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:5: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:6: UINT8 currentspriteindex = 0;
	ld	c, #0x00
;main.c:7: set_sprite_data(0, 2, Okabe);
	ld	de, #_Okabe
	push	de
	ld	hl, #0x200
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;c:/gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, #0x4e
	ld	(hl+), a
	ld	(hl), #0x58
;main.c:10: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:12: while(1){
00110$:
;main.c:13: if(currentspriteindex==0){
	ld	a, c
	or	a, a
;main.c:14: currentspriteindex = 1;
;main.c:17: currentspriteindex = 0;
	ld	c, #0x01
	jr	Z, 00103$
	ld	c, #0x00
00103$:
;main.c:20: switch(joypad()){
	call	_joypad
	cp	a, #0x01
	jr	Z, 00105$
	cp	a, #0x02
	jr	Z, 00104$
	cp	a, #0x04
	jr	Z, 00106$
	sub	a, #0x08
	jr	Z, 00107$
	jr	00108$
;main.c:21: case J_LEFT:
00104$:
;c:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
;c:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (de)
	ld	(de), a
	inc	de
	ld	a, (de)
	add	a, #0xf6
	ld	(de), a
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;main.c:24: break;
	jr	00108$
;main.c:25: case J_RIGHT:
00105$:
;c:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (de)
	ld	(de), a
	inc	de
	ld	a, (de)
	add	a, #0x0a
	ld	(de), a
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;main.c:28: break;
	jr	00108$
;main.c:29: case J_UP:
00106$:
;c:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (de)
	add	a, #0xf6
	ld	(de), a
	inc	de
	ld	a, (de)
	ld	(de), a
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;main.c:32: break;
	jr	00108$
;main.c:33: case J_DOWN:
00107$:
;c:/gbdk/include/gb/gb.h:1691: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1692: itm->y+=y, itm->x+=x;
	ld	a, (de)
	add	a, #0x0a
	ld	(de), a
	inc	de
	ld	a, (de)
	ld	(de), a
;c:/gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), c
;main.c:37: }
00108$:
;main.c:38: delay(100);
	push	bc
	ld	de, #0x0064
	call	_delay
	pop	bc
;main.c:44: }
	jr	00110$
	.area _CODE
	.area _INITIALIZER
__xinit__Okabe:
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x6c	; 108	'l'
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0xba	; 186
	.db #0xfe	; 254
	.db #0x28	; 40
	.db #0x6c	; 108	'l'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0x82	; 130
	.db #0x6c	; 108	'l'
	.db #0xfe	; 254
	.db #0xaa	; 170
	.db #0xfe	; 254
	.db #0xba	; 186
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.area _CABS (ABS)
