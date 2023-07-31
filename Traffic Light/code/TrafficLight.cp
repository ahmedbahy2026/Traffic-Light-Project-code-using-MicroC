#line 1 "//Mac/Home/Downloads/Ahmed Bahy/Flasher/code/TrafficLight.c"
short i=0,x;










void counter(short,short,short);
void main()
{
 trisd=0; portd=0;
 trisc=0; portc=0;
 trisb=1;
 trisA.b4=1;
 while(portA.b4);
 while(!portA.b4);
 while(1)
 {
 if(! portb.B0 )
 {
  portd.b7 =1;  portd.b6 =1;
  portd.b3 =1;  portd.b5 =0;  portd.b4 =0;
  portd.b0 =0;  portd.B2 =1;  portd.b1 =0;
 if(! portb.B0 )
 counter(15,0,0);
  portd.b3 =0;  portd.b5 =1;  portd.b4 =0;
  portd.b0 =1;  portd.B2 =0;  portd.b1 =0;
 if(! portb.B0 )
 counter(23,1,0) ;
 }else if( portb.B0  &&  portb.b1 )
 {
  portd.b7 =1;  portd.b6 =0;
  portd.b3 =0;  portd.b5 =0;  portd.b4 =1;
  portd.b0 =1;  portd.B2 =0;  portd.b1 =0;
 if( portb.B0  &&  portb.b1 )
 counter(3,-1,1);
  portd.b7 =0;  portd.b6 =0;
  portd.b3 =0;  portd.b5 =1;  portd.b4 =0;
 while( portb.B0  &&  portb.b1 );
  portd.b3 =0;  portd.b5 =0;  portd.b4 =0;
 }else if( portb.B0  && ! portb.b1 )
 {
  portd.b7 =0;  portd.b6 =1;
  portd.b3 =1;  portd.b5 =0;  portd.b4 =0;
  portd.b0 =0;  portd.B2 =0;  portd.b1 =1;
 if( portb.B0  && ! portb.b1 )
 counter(3,-1,2);
  portd.b7 =0;  portd.b6 =0;
  portd.b0 =0;  portd.B2 =1;  portd.b1 =0;
 while(! portb.b1  &&  portb.B0 );
  portd.b0 =0;  portd.B2 =0;  portd.b1 =0;
 }
 }
}

void counter(short cnt,short flag,short cur_state)
{
 portC=cnt%10+16*(cnt/10);
 while(1)
 {
 for(i=cnt%10;i>0;i--)
 {
 if(flag==0 && cnt==3){
  portd.B2 =0;  portd.b1 =1;
 }
 if(flag==1 && cnt==3){
  portd.b5 =0;  portd.b4 =1;
 }

 x=2000;
 while(x--)
 {
 delay_ms(2);
 if((cur_state==0 &&  portb.B0 ) || (cur_state==1 &&(! portb.B0  || ! portb.b1 ))|| (cur_state==2 &&(! portb.B0  ||  portb.b1 )))
 return;
 }
 portC--;
 cnt--;
 }
 if(cnt==0)
 return;
 if((cur_state==0 &&  portb.B0 ) || (cur_state==1 &&(! portb.B0  || ! portb.b1 ))|| (cur_state==2 &&(! portb.B0  ||  portb.b1 )))
 return;

 x=2000;
 while(x--)
 {
 delay_ms(2);
 if((cur_state==0 &&  portb.B0 ) || (cur_state==1 &&(! portb.B0  || ! portb.b1 ))|| (cur_state==2 &&(! portb.B0  ||  portb.b1 )))
 return;
 }
 portC-=16;
 cnt--;
 portC+=cnt%10;
 }
}
