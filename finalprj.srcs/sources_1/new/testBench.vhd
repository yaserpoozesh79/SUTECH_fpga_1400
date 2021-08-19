library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.myPackage.all;

entity testBench is
--  Port ( );
end testBench;



architecture Behavioral of testBench is
     
    signal CLOCK:std_logic:= '0';
    signal RST, SET_TIME, SET_ALARM, STOP_ALARM, 
           ALARM_ON, CLOCK_ON, ALARM: std_logic;
    signal H_IN1, H_IN0, M_IN1, M_IN0 : unsigned(3 downto 0);
    signal H_OUT1, H_OUT0, M_OUT1, M_OUT0,
           S_OUT1, S_OUT0: std_logic_vector(7 downto 0);
    
begin
    
    RST <= '1', '0' after 1ns;
    
    CLOCK <= not CLOCK after PERIOD/2;
    
    
    SET_TIME <=    '0', '0' after 2000 ms, '1' after 4000 ms, '0' after 5000 ms, '0' after 6000 ms, '0' after 120000 ms;
    SET_ALARM <=   '0', '0' after 2000 ms, '0' after 4000 ms, '1' after 5000 ms, '0' after 6000 ms, '0' after 120000 ms;
    STOP_ALARM <=  '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '0' after 6000 ms, '0' after 120000 ms;
    ALARM_ON <=    '0', '0' after 2000 ms, '0' after 4000 ms, '0' after 5000 ms, '1' after 6000 ms, '1' after 120000 ms;
    CLOCK_ON <=    '0', '1' after 2000 ms, '1' after 4000 ms, '1' after 5000 ms, '1' after 6000 ms, '1' after 120000 ms;
    H_IN1 <=      x"0",x"0" after 2000 ms,x"0" after 4000 ms,x"0" after 5000 ms,x"0" after 6000 ms,x"0" after 120000 ms;
    H_IN0 <=      x"0",x"0" after 2000 ms,x"4" after 4000 ms,x"4" after 5000 ms,x"0" after 6000 ms,x"0" after 120000 ms;
    M_IN1 <=      x"0",x"0" after 2000 ms,x"2" after 4000 ms,x"2" after 5000 ms,x"0" after 6000 ms,x"0" after 120000 ms;
    M_IN0 <=      x"0",x"0" after 2000 ms,x"0" after 4000 ms,x"2" after 5000 ms,x"0" after 6000 ms,x"0" after 120000 ms;
    
--    SET_TIME <=    '0' after 130000 ms, '1' after 4000 ms, '0' after 5000 ms, '0' after 6000 ms, '0' after 120000 ms;
--    SET_ALARM <=   '0' after 130000 ms, '0' after 4000 ms, '1' after 5000 ms, '0' after 6000 ms, '0' after 120000 ms;
--    STOP_ALARM <=  '0' after 130000 ms, '0' after 4000 ms, '0' after 5000 ms, '0' after 6000 ms, '0' after 120000 ms;
--    ALARM_ON <=    '0' after 130000 ms, '0' after 4000 ms, '0' after 5000 ms, '1' after 6000 ms, '1' after 120000 ms;
--    CLOCK_ON <=    '1' after 130000 ms, '1' after 4000 ms, '1' after 5000 ms, '1' after 6000 ms, '1' after 120000 ms;
--    H_IN1 <=      x"0" after 130000 ms,x"0" after 4000 ms,x"0" after 5000 ms,x"0" after 6000 ms,x"0" after 120000 ms;
--    H_IN0 <=      x"0" after 130000 ms,x"4" after 4000 ms,x"4" after 5000 ms,x"0" after 6000 ms,x"0" after 120000 ms;
--    M_IN1 <=      x"0" after 130000 ms,x"2" after 4000 ms,x"2" after 5000 ms,x"0" after 6000 ms,x"0" after 120000 ms;
--    M_IN0 <=      x"0" after 130000 ms,x"0" after 4000 ms,x"2" after 5000 ms,x"0" after 6000 ms,x"0" after 120000 ms;
    

    REL: BUZZERCLOCK port map(RESET => RST,
                              CLK => CLOCK,
                              SET_TIME => SET_TIME,
                              SET_ALARM => SET_ALARM,
                              STOP_ALARM =>STOP_ALARM,
                              ALARM_ON => ALARM_ON,
                              CLOCK_ON => CLOCK_ON,
                              H_IN1 => H_IN1,
                              H_IN0 => H_IN0,
                              M_IN1 => M_IN1,
                              M_IN0 => M_IN0,
                              ALARM => ALARM,
                              H_OUT1 => H_OUT1,
                              H_OUT0 => H_OUT0,
                              M_OUT1 => M_OUT1,
                              M_OUT0 => M_OUT0,
                              S_OUT1 => S_OUT1,
                              S_OUT0 => S_OUT0
                              ); 



end Behavioral;