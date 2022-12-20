#include <gb/gb.h>
#include <stdio.h>
#include "OkabeMoveSprite.c"

void main(){
    UINT8 currentspriteindex = 0;
    set_sprite_data(0, 2, Okabe);
    set_sprite_tile(0, 0);
    move_sprite(0, 88, 78);
    SHOW_SPRITES;

    while(1){
       if(currentspriteindex==0){
        currentspriteindex = 1;
       }
       else{
        currentspriteindex = 0;
       }
       
       switch(joypad()){
        case J_LEFT:
            scroll_sprite(0,-10,0);
            set_sprite_tile(0, currentspriteindex);
            break;
        case J_RIGHT:
            scroll_sprite(0, 10,0);
            set_sprite_tile(0, currentspriteindex);
            break;
        case J_UP:
            scroll_sprite(0, 0,-10);
            set_sprite_tile(0, currentspriteindex);
            break;
        case J_DOWN:
            scroll_sprite(0, 0, 10);
            set_sprite_tile(0, currentspriteindex);
            break;
       }
       delay(100);

      
       
    }
    
}