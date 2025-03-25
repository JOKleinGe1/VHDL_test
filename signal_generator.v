-- AAV 1 : programmer la carte FPGA avec ce code. 
-- la sortie sera sur une LED. 
-- criteres : 
-- 1. autonomie. 
-- 2. configuration projet, notamment des sorties actives (choix) et inactives (Z). 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity signal_generator is
    Port (
        clk      : in  STD_LOGIC;  -- Horloge
        signal_out : out STD_LOGIC  -- Signal de sortie
    );
end signal_generator;

architecture Behavioral of signal_generator is
    signal shift_reg : STD_LOGIC_VECTOR(31 downto 0) := "01001001001110111011100100100100"; 
    signal prescaler : INTEGER range 0 to 10000000 := 0;
    signal index : INTEGER range 0 to 31 := 0;

begin
    process
    begin
	wait until  rising_edge(clk);
    		prescaler <= (prescaler + 1) mod 10000000; 
            signal_out <= shift_reg(index);
            if (prescaler = 0) then 
            	index <= (index + 1) mod 32;
            end if;
    end process;
end Behavioral;
