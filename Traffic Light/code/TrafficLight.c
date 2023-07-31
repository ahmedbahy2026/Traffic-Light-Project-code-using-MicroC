short i=0,x;
#define west_green    portd.b5
#define west_yellow   portd.b4
#define west_red      portd.b3
#define south_green   portd.B2
#define south_yellow  portd.b1
#define south_red     portd.b0
#define is_Manual     portb.B0
#define West_Man      portb.b1
#define west7seg      portd.b7
#define south7seg     portd.b6
void counter(short,short,short);
void main() 
{
    trisd=0;     portd=0;
    trisc=0;     portc=0;
    trisb=1;
    trisA.b4=1;
    while(portA.b4);
    while(!portA.b4);
    while(1)
    {
             if(!is_Manual)
             {
                 west7seg=1;    south7seg=1;
                 west_red=1;   west_green=0;   west_yellow=0;
                 south_red=0;  south_green=1;  south_yellow=0;
                 if(!is_Manual)
                          counter(15,0,0);
                 west_red=0;   west_green=1;   west_yellow=0;
                 south_red=1;  south_green=0;  south_yellow=0;
                 if(!is_Manual)
                          counter(23,1,0) ;
             }else if(is_Manual && West_Man)    //Manual and west is ON
             {
                  west7seg=1;    south7seg=0;
                  west_red=0;   west_green=0;   west_yellow=1;
                  south_red=1;  south_green=0;  south_yellow=0;
                  if(is_Manual && West_Man)
                               counter(3,-1,1);
                  west7seg=0;    south7seg=0;
                  west_red=0;   west_green=1;   west_yellow=0;
                  while(is_Manual && West_Man);
                  west_red=0;   west_green=0;   west_yellow=0;
             }else if(is_Manual && !West_Man)    //Manual and south is ON
             {
                  west7seg=0;    south7seg=1;
                  west_red=1;   west_green=0;   west_yellow=0;
                  south_red=0;  south_green=0;  south_yellow=1;
                  if(is_Manual && !West_Man)
                               counter(3,-1,2);
                  west7seg=0;    south7seg=0;
                  south_red=0;  south_green=1;  south_yellow=0;
                  while(!West_Man && is_Manual);
                  south_red=0;  south_green=0;  south_yellow=0;
             }
    }
}
// cur_state 0 for automatic and 1 for West_Man and 2 for South_Man
void counter(short cnt,short flag,short cur_state)      // if flag==0 then we count 15 westred else we count 23 southred  and -1 for Manual Mode
{
    portC=cnt%10+16*(cnt/10);
    while(1)
    {
          for(i=cnt%10;i>0;i--)
          {
               if(flag==0 && cnt==3){
                    south_green=0;  south_yellow=1;
               }
               if(flag==1 && cnt==3){
                    west_green=0;  west_yellow=1;
               }
//               delay_ms(1000);
               x=2000;
               while(x--)
               {
                     delay_ms(2);
                     if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
                          return;
               }
               portC--;
               cnt--;
          }
          if(cnt==0)
              return;
          if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
                  return;
//          delay_ms(1000);
            x=2000;
            while(x--)
            {
                 delay_ms(2);
                 if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
                      return;
            }
          portC-=16;
          cnt--;
          portC+=cnt%10;
    }
}