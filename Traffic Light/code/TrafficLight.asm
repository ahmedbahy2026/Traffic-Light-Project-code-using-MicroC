
_main:

;TrafficLight.c,13 :: 		void main()
;TrafficLight.c,15 :: 		trisd=0;     portd=0;
	CLRF       TRISD+0
	CLRF       PORTD+0
;TrafficLight.c,16 :: 		trisc=0;     portc=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;TrafficLight.c,17 :: 		trisb=1;
	MOVLW      1
	MOVWF      TRISB+0
;TrafficLight.c,18 :: 		trisA.b4=1;
	BSF        TRISA+0, 4
;TrafficLight.c,19 :: 		while(portA.b4);
L_main0:
	BTFSS      PORTA+0, 4
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;TrafficLight.c,20 :: 		while(!portA.b4);
L_main2:
	BTFSC      PORTA+0, 4
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;TrafficLight.c,21 :: 		while(1)
L_main4:
;TrafficLight.c,23 :: 		if(!is_Manual)
	BTFSC      PORTB+0, 0
	GOTO       L_main6
;TrafficLight.c,25 :: 		west7seg=1;    south7seg=1;
	BSF        PORTD+0, 7
	BSF        PORTD+0, 6
;TrafficLight.c,26 :: 		west_red=1;   west_green=0;   west_yellow=0;
	BSF        PORTD+0, 3
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
;TrafficLight.c,27 :: 		south_red=0;  south_green=1;  south_yellow=0;
	BCF        PORTD+0, 0
	BSF        PORTD+0, 2
	BCF        PORTD+0, 1
;TrafficLight.c,28 :: 		if(!is_Manual)
	BTFSC      PORTB+0, 0
	GOTO       L_main7
;TrafficLight.c,29 :: 		counter(15,0,0);
	MOVLW      15
	MOVWF      FARG_counter+0
	CLRF       FARG_counter+0
	CLRF       FARG_counter+0
	CALL       _counter+0
L_main7:
;TrafficLight.c,30 :: 		west_red=0;   west_green=1;   west_yellow=0;
	BCF        PORTD+0, 3
	BSF        PORTD+0, 5
	BCF        PORTD+0, 4
;TrafficLight.c,31 :: 		south_red=1;  south_green=0;  south_yellow=0;
	BSF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
;TrafficLight.c,32 :: 		if(!is_Manual)
	BTFSC      PORTB+0, 0
	GOTO       L_main8
;TrafficLight.c,33 :: 		counter(23,1,0) ;
	MOVLW      23
	MOVWF      FARG_counter+0
	MOVLW      1
	MOVWF      FARG_counter+0
	CLRF       FARG_counter+0
	CALL       _counter+0
L_main8:
;TrafficLight.c,34 :: 		}else if(is_Manual && West_Man)    //Manual and west is ON
	GOTO       L_main9
L_main6:
	BTFSS      PORTB+0, 0
	GOTO       L_main12
	BTFSS      PORTB+0, 1
	GOTO       L_main12
L__main93:
;TrafficLight.c,36 :: 		west7seg=1;    south7seg=0;
	BSF        PORTD+0, 7
	BCF        PORTD+0, 6
;TrafficLight.c,37 :: 		west_red=0;   west_green=0;   west_yellow=1;
	BCF        PORTD+0, 3
	BCF        PORTD+0, 5
	BSF        PORTD+0, 4
;TrafficLight.c,38 :: 		south_red=1;  south_green=0;  south_yellow=0;
	BSF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
;TrafficLight.c,39 :: 		if(is_Manual && West_Man)
	BTFSS      PORTB+0, 0
	GOTO       L_main15
	BTFSS      PORTB+0, 1
	GOTO       L_main15
L__main92:
;TrafficLight.c,40 :: 		counter(3,-1,1);
	MOVLW      3
	MOVWF      FARG_counter+0
	MOVLW      255
	MOVWF      FARG_counter+0
	MOVLW      1
	MOVWF      FARG_counter+0
	CALL       _counter+0
L_main15:
;TrafficLight.c,41 :: 		west7seg=0;    south7seg=0;
	BCF        PORTD+0, 7
	BCF        PORTD+0, 6
;TrafficLight.c,42 :: 		west_red=0;   west_green=1;   west_yellow=0;
	BCF        PORTD+0, 3
	BSF        PORTD+0, 5
	BCF        PORTD+0, 4
;TrafficLight.c,43 :: 		while(is_Manual && West_Man);
L_main16:
	BTFSS      PORTB+0, 0
	GOTO       L_main17
	BTFSS      PORTB+0, 1
	GOTO       L_main17
L__main91:
	GOTO       L_main16
L_main17:
;TrafficLight.c,44 :: 		west_red=0;   west_green=0;   west_yellow=0;
	BCF        PORTD+0, 3
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
;TrafficLight.c,45 :: 		}else if(is_Manual && !West_Man)    //Manual and south is ON
	GOTO       L_main20
L_main12:
	BTFSS      PORTB+0, 0
	GOTO       L_main23
	BTFSC      PORTB+0, 1
	GOTO       L_main23
L__main90:
;TrafficLight.c,47 :: 		west7seg=0;    south7seg=1;
	BCF        PORTD+0, 7
	BSF        PORTD+0, 6
;TrafficLight.c,48 :: 		west_red=1;   west_green=0;   west_yellow=0;
	BSF        PORTD+0, 3
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
;TrafficLight.c,49 :: 		south_red=0;  south_green=0;  south_yellow=1;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 2
	BSF        PORTD+0, 1
;TrafficLight.c,50 :: 		if(is_Manual && !West_Man)
	BTFSS      PORTB+0, 0
	GOTO       L_main26
	BTFSC      PORTB+0, 1
	GOTO       L_main26
L__main89:
;TrafficLight.c,51 :: 		counter(3,-1,2);
	MOVLW      3
	MOVWF      FARG_counter+0
	MOVLW      255
	MOVWF      FARG_counter+0
	MOVLW      2
	MOVWF      FARG_counter+0
	CALL       _counter+0
L_main26:
;TrafficLight.c,52 :: 		west7seg=0;    south7seg=0;
	BCF        PORTD+0, 7
	BCF        PORTD+0, 6
;TrafficLight.c,53 :: 		south_red=0;  south_green=1;  south_yellow=0;
	BCF        PORTD+0, 0
	BSF        PORTD+0, 2
	BCF        PORTD+0, 1
;TrafficLight.c,54 :: 		while(!West_Man && is_Manual);
L_main27:
	BTFSC      PORTB+0, 1
	GOTO       L_main28
	BTFSS      PORTB+0, 0
	GOTO       L_main28
L__main88:
	GOTO       L_main27
L_main28:
;TrafficLight.c,55 :: 		south_red=0;  south_green=0;  south_yellow=0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
;TrafficLight.c,56 :: 		}
L_main23:
L_main20:
L_main9:
;TrafficLight.c,57 :: 		}
	GOTO       L_main4
;TrafficLight.c,58 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_counter:

;TrafficLight.c,60 :: 		void counter(short cnt,short flag,short cur_state)      // if flag==0 then we count 15 westred else we count 23 southred  and -1 for Manual Mode
;TrafficLight.c,62 :: 		portC=cnt%10+16*(cnt/10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_cnt+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__counter+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_cnt+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVLW      4
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
L__counter116:
	BTFSC      STATUS+0, 2
	GOTO       L__counter117
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__counter116
L__counter117:
	MOVF       R1+0, 0
	ADDWF      FLOC__counter+0, 0
	MOVWF      PORTC+0
;TrafficLight.c,63 :: 		while(1)
L_counter31:
;TrafficLight.c,65 :: 		for(i=cnt%10;i>0;i--)
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_cnt+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _i+0
L_counter33:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_counter34
;TrafficLight.c,67 :: 		if(flag==0 && cnt==3){
	MOVF       FARG_counter_flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_counter38
	MOVF       FARG_counter_cnt+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_counter38
L__counter113:
;TrafficLight.c,68 :: 		south_green=0;  south_yellow=1;
	BCF        PORTD+0, 2
	BSF        PORTD+0, 1
;TrafficLight.c,69 :: 		}
L_counter38:
;TrafficLight.c,70 :: 		if(flag==1 && cnt==3){
	MOVF       FARG_counter_flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_counter41
	MOVF       FARG_counter_cnt+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_counter41
L__counter112:
;TrafficLight.c,71 :: 		west_green=0;  west_yellow=1;
	BCF        PORTD+0, 5
	BSF        PORTD+0, 4
;TrafficLight.c,72 :: 		}
L_counter41:
;TrafficLight.c,74 :: 		x=2000;
	MOVLW      208
	MOVWF      _x+0
;TrafficLight.c,75 :: 		while(x--)
L_counter42:
	MOVF       _x+0, 0
	MOVWF      R0+0
	DECF       _x+0, 1
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_counter43
;TrafficLight.c,77 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_counter44:
	DECFSZ     R13+0, 1
	GOTO       L_counter44
	DECFSZ     R12+0, 1
	GOTO       L_counter44
	NOP
;TrafficLight.c,78 :: 		if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__counter111
	BTFSS      PORTB+0, 0
	GOTO       L__counter111
	GOTO       L__counter106
L__counter111:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__counter109
	BTFSS      PORTB+0, 0
	GOTO       L__counter110
	BTFSS      PORTB+0, 1
	GOTO       L__counter110
	GOTO       L__counter109
L__counter110:
	GOTO       L__counter106
L__counter109:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__counter107
	BTFSS      PORTB+0, 0
	GOTO       L__counter108
	BTFSC      PORTB+0, 1
	GOTO       L__counter108
	GOTO       L__counter107
L__counter108:
	GOTO       L__counter106
L__counter107:
	GOTO       L_counter57
L__counter106:
;TrafficLight.c,79 :: 		return;
	GOTO       L_end_counter
L_counter57:
;TrafficLight.c,80 :: 		}
	GOTO       L_counter42
L_counter43:
;TrafficLight.c,81 :: 		portC--;
	DECF       PORTC+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;TrafficLight.c,82 :: 		cnt--;
	DECF       FARG_counter_cnt+0, 1
;TrafficLight.c,65 :: 		for(i=cnt%10;i>0;i--)
	DECF       _i+0, 1
;TrafficLight.c,83 :: 		}
	GOTO       L_counter33
L_counter34:
;TrafficLight.c,84 :: 		if(cnt==0)
	MOVF       FARG_counter_cnt+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_counter58
;TrafficLight.c,85 :: 		return;
	GOTO       L_end_counter
L_counter58:
;TrafficLight.c,86 :: 		if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__counter105
	BTFSS      PORTB+0, 0
	GOTO       L__counter105
	GOTO       L__counter100
L__counter105:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__counter103
	BTFSS      PORTB+0, 0
	GOTO       L__counter104
	BTFSS      PORTB+0, 1
	GOTO       L__counter104
	GOTO       L__counter103
L__counter104:
	GOTO       L__counter100
L__counter103:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__counter101
	BTFSS      PORTB+0, 0
	GOTO       L__counter102
	BTFSC      PORTB+0, 1
	GOTO       L__counter102
	GOTO       L__counter101
L__counter102:
	GOTO       L__counter100
L__counter101:
	GOTO       L_counter71
L__counter100:
;TrafficLight.c,87 :: 		return;
	GOTO       L_end_counter
L_counter71:
;TrafficLight.c,89 :: 		x=2000;
	MOVLW      208
	MOVWF      _x+0
;TrafficLight.c,90 :: 		while(x--)
L_counter72:
	MOVF       _x+0, 0
	MOVWF      R0+0
	DECF       _x+0, 1
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_counter73
;TrafficLight.c,92 :: 		delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_counter74:
	DECFSZ     R13+0, 1
	GOTO       L_counter74
	DECFSZ     R12+0, 1
	GOTO       L_counter74
	NOP
;TrafficLight.c,93 :: 		if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__counter99
	BTFSS      PORTB+0, 0
	GOTO       L__counter99
	GOTO       L__counter94
L__counter99:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__counter97
	BTFSS      PORTB+0, 0
	GOTO       L__counter98
	BTFSS      PORTB+0, 1
	GOTO       L__counter98
	GOTO       L__counter97
L__counter98:
	GOTO       L__counter94
L__counter97:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__counter95
	BTFSS      PORTB+0, 0
	GOTO       L__counter96
	BTFSC      PORTB+0, 1
	GOTO       L__counter96
	GOTO       L__counter95
L__counter96:
	GOTO       L__counter94
L__counter95:
	GOTO       L_counter87
L__counter94:
;TrafficLight.c,94 :: 		return;
	GOTO       L_end_counter
L_counter87:
;TrafficLight.c,95 :: 		}
	GOTO       L_counter72
L_counter73:
;TrafficLight.c,96 :: 		portC-=16;
	MOVLW      16
	SUBWF      PORTC+0, 1
;TrafficLight.c,97 :: 		cnt--;
	DECF       FARG_counter_cnt+0, 1
;TrafficLight.c,98 :: 		portC+=cnt%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_cnt+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      PORTC+0, 1
;TrafficLight.c,99 :: 		}
	GOTO       L_counter31
;TrafficLight.c,100 :: 		}
L_end_counter:
	RETURN
; end of _counter
