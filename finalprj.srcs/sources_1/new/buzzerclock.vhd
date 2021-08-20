library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library WORK;
use WORK.myPackage.all;

entity BUZZERCLOCK is
    port (RESET, CLK, SET_TIME, SET_ALARM, STOP_ALARM, ALARM_ON, CLOCK_ON: in std_logic; 
          H_IN1, H_IN0, M_IN1, M_IN0 : in unsigned(3 downto 0);
          ALARM: out std_logic;
          H_OUT1, H_OUT0, M_OUT1, M_OUT0, S_OUT1, S_OUT0: out std_logic_vector(6 downto 0) 
          );
          
          
          
end BUZZERCLOCK;




architecture RTL of BUZZERCLOCK is
    
    subtype STATE_TYPE is std_logic_vector(4 downto 0);
    constant START: STATE_TYPE:= b"00001";
    constant WORK_NORMAL: STATE_TYPE:= b"00010";
    constant SETUP_ALARM: STATE_TYPE:= b"00100";
    constant SETUP_TIME: STATE_TYPE:= b"01000";
    constant BUZZER_ON: STATE_TYPE:= b"10000";
    
    signal STATE, NEXTSTATE: STATE_TYPE; 
    
    signal C_H: integer range 0 to 24;
    signal C_M, C_S: integer range 0 to 60;  -- current time values
    
    signal A_H: integer range 0 to 24;
    signal A_M, A_S: integer range 0 to 60;  -- alarm time values
    
    signal COUNTER: integer range 0 to frequency;        -- counts clocks to reach 1 second
    
    signal RESET_TIME, INC_SEC: std_logic;

begin
    REG: process
    begin
        if(RESET = '1') then
            STATE <= START;
            RESET_TIME <= '1';
            INC_SEC <= '0';
            COUNTER <= 1;
        elsif(CLK'event and CLK = '1' and CLK'last_value = '0') then
            RESET_TIME <= '0';
            INC_SEC <= '0';
            STATE <= NEXTSTATE;
            if(COUNTER < frequency) then
                COUNTER <= COUNTER + 1;
            elsif(COUNTER = frequency) then
                COUNTER <= 1; 
                INC_SEC <= '1';
            else
                COUNTER <= 1;       
            end if;
        end if;
        
        wait on RESET,CLK;
    end process;
    
    
    CMB: process
    begin
        case STATE is 
            when START => 
                if(CLOCK_ON = '1') then 
                    NEXTSTATE <= WORK_NORMAL;
                end if;
            when WORK_NORMAL => 
                ALARM <= '0';
                if(CLOCK_ON /= '1') then 
                    NEXTSTATE <= START;
                elsif(SET_ALARM = '1') then
                    NEXTSTATE <= SETUP_ALARM;
                elsif(SET_TIME = '1') then
                    NEXTSTATE <= SETUP_TIME;
                elsif(ALARM_ON = '1'
                      and C_H = A_H
                      and C_M = A_M
                      and C_S = A_S) then
                    NEXTSTATE <= BUZZER_ON;         
                end if;
            when SETUP_ALARM => 
                if(SET_ALARM /= '1') then 
                    NEXTSTATE <= WORK_NORMAL;
                else
                    A_H <= To_INTEGER(H_IN1) * 10 + To_INTEGER(H_IN0);
                    A_M <= To_INTEGER(M_IN1) * 10 + To_INTEGER(M_IN0);
                    A_S <= 0;   
                end if;
            when SETUP_TIME => 
                if(SET_TIME /= '1') then 
                    NEXTSTATE <= WORK_NORMAL;
                else
                    C_H <= To_INTEGER(H_IN1) * 10 + To_INTEGER(H_IN0);
                    C_M <= To_INTEGER(M_IN1) * 10 + To_INTEGER(M_IN0);   
                end if;
            when BUZZER_ON => 
                if(STOP_ALARM = '1' or 
                   ALARM_ON /= '1' or
                   TIME_IN_SECONDS(C_H, C_M, C_S) = TIME_IN_SECONDS(A_H, A_M, A_S) + 10
                   ) then 
                    NEXTSTATE <= WORK_NORMAL;
                elsif(TIME_IN_SECONDS(C_H, C_M, C_S) < TIME_IN_SECONDS(A_H, A_M, A_S) + 10) then 
                      ALARM <= '1';     
                end if;
            when others =>
                NEXTSTATE <= START;        
        end case;
        
        if (STATE /= START and INC_SEC'event and INC_SEC = '1') then
            if(C_S < 59) then
                C_S <= C_S + 1;
            else
                C_S <= 0; 
                if(C_M < 59) then
                    C_M <= C_M + 1;
                else 
                    C_M <= 0;
                    if(C_H < 23) then
                        C_H <= C_H + 1;
                    else
                        C_H <= 0;    
                    end if;   
                end if;   
            end if;
        end if;
        if (RESET_TIME = '1') then
            C_H <= 0;
            C_M <= 0;
            C_S <= 0;
            ALARM <= '0';
        end if;
        
        H_OUT1 <= INT_TO_7SEG(C_H/10);
        H_OUT0 <= INT_TO_7SEG(C_H mod 10);
        M_OUT1 <= INT_TO_7SEG(C_M/10);
        M_OUT0 <= INT_TO_7SEG(C_M mod 10);
        S_OUT1 <= INT_TO_7SEG(C_S/10);
        S_OUT0 <= INT_TO_7SEG(C_S mod 10);
        
        wait on STATE, SET_TIME, SET_ALARM, STOP_ALARM, ALARM_ON, CLOCK_ON,
                C_H, C_M, C_S, A_H, A_M, A_S,
                H_IN1, H_IN0, M_IN1, M_IN0, 
                RESET_TIME, INC_SEC;
    end process;
    
    
    
end RTL;
